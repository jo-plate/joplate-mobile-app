import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';

@RoutePage()
class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(m.feed.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: m.home.car_number),
            Tab(text: m.home.phone_numbers),
          ],
        ),
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, authSnapshot) {
          // Handle authentication state
          if (authSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final currentUser = authSnapshot.data;
          if (currentUser == null) {
            // User is not logged in
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    m.feed.login_required,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => AutoRouter.of(context).push(const AuthRoute()),
                    child: Text(m.feed.sign_in),
                  )
                ],
              ),
            );
          }

          // User is logged in, now fetch their profile
          return StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection(userProfileCollectionId).doc(currentUser.uid).snapshots(),
            builder: (context, profileSnapshot) {
              if (profileSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (profileSnapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${m.feed.error_loading} ${profileSnapshot.error}',
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => setState(() {}), // Refresh
                        child: Text(m.feed.retry),
                      ),
                    ],
                  ),
                );
              }

              if (!profileSnapshot.hasData || !profileSnapshot.data!.exists) {
                return Center(child: Text(m.feed.user_not_found));
              }

              // Extract following list from the user profile
              final userData = profileSnapshot.data!.data() as Map<String, dynamic>?;
              final userProfile = userData != null ? UserProfile.fromJson(userData) : UserProfile.empty();
              final followingIds = userProfile.followingList;

              if (followingIds.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        m.feed.empty_feed,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        m.feed.follow_users,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => AutoRouter.of(context).push(const PlatesListingsRoute()),
                        child: Text(m.feed.explore_listings),
                      ),
                    ],
                  ),
                );
              }

              // User has followings, show the TabBarView
              return TabBarView(
                controller: _tabController,
                children: [
                  _buildPlateListingsTab(followingIds),
                  _buildPhoneListingsTab(followingIds),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPlateListingsTab(List<String> followingIds) {
    final m = Localization.of(context);
    if (followingIds.isEmpty) {
      return Center(child: Text(m.feed.no_users_followed));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(carPlatesCollectionId)
          .where('userId', whereIn: followingIds)
          .where('isDisabled', isEqualTo: false)
          .where('isSold', isEqualTo: false)
          .where('expiresAt', isGreaterThan: Timestamp.fromDate(DateTime.now()))
          .orderBy('expiresAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('${m.feed.error_generic} ${snapshot.error}'),
          );
        }

        final plates = snapshot.data?.docs.map((doc) => PlateListing.fromSnapshot(doc)).toList() ?? [];

        if (plates.isEmpty) {
          return Center(
            child: Text(m.feed.no_plate_listings),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: PlatesListingsGrid(
              itemList: plates,
              shrinkWrap: true,
            ),
          ),
        );
      },
    );
  }

  Widget _buildPhoneListingsTab(List<String> followingIds) {
    final m = Localization.of(context);
    if (followingIds.isEmpty) {
      return Center(child: Text(m.feed.no_users_followed));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(phoneNumbersCollectionId)
          .where('userId', whereIn: followingIds)
          .where('isDisabled', isEqualTo: false)
          .where('isSold', isEqualTo: false)
          .where('expiresAt', isGreaterThan: Timestamp.fromDate(DateTime.now()))
          .orderBy('expiresAt', descending: true)
          .limit(50)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('${m.feed.error_generic} ${snapshot.error}'),
          );
        }

        final phones = snapshot.data?.docs.map((doc) => PhoneListing.fromSnapshot(doc)).toList() ?? [];

        if (phones.isEmpty) {
          return Center(
            child: Text(m.feed.no_phone_listings),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: PhonesListingGrid(
              itemList: phones,
              shrinkWrap: true,
            ),
          ),
        );
      },
    );
  }
}
