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
  late Stream<UserProfile?> _currentUserStream;
  List<String> _followingIds = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'You must be logged in to view the feed';
      });
      return;
    }

    _currentUserStream = FirebaseFirestore.instance
        .collection(userProfileCollectionId)
        .doc(currentUserId)
        .snapshots()
        .map((snapshot) => snapshot.exists ? UserProfile.fromJson(snapshot.data()!) : null);

    _currentUserStream.listen((profile) {
      if (profile != null) {
        setState(() {
          _followingIds = profile.followingList;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Could not load user profile';
        });
      }
    }, onError: (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error loading user data: $error';
      });
    });
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
        title: const Text('Feed'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: m.home.car_number),
            Tab(text: m.home.phone_numbers),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      if (_errorMessage == 'You must be logged in to view the feed')
                        ElevatedButton(
                          onPressed: () => AutoRouter.of(context).push(const AuthRoute()),
                          child: const Text('Sign In'),
                        )
                      else
                        ElevatedButton(
                          onPressed: _loadCurrentUser,
                          child: const Text('Retry'),
                        ),
                    ],
                  ),
                )
              : _followingIds.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your feed is empty',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Follow users to see their listings here',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => AutoRouter.of(context).push(const PlatesListingsRoute()),
                            child: const Text('Explore Listings'),
                          ),
                        ],
                      ),
                    )
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _buildPlateListingsTab(),
                        _buildPhoneListingsTab(),
                      ],
                    ),
    );
  }

  Widget _buildPlateListingsTab() {
    if (_followingIds.isEmpty) {
      return const Center(child: Text('No users followed yet'));
    }

    return StreamBuilder<List<PlateListing>>(
      stream: FirebaseFirestore.instance
          .collection(carPlatesCollectionId)
          .where('userId', whereIn: _followingIds)
          .where('isDisabled', isEqualTo: false)
          .where('isSold', isEqualTo: false)
          .where('expiresAt', isGreaterThan: DateTime.now())
          .orderBy('createdAt', descending: true)
          .limit(50)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => PlateListing.fromSnapshot(doc)).toList()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        final plates = snapshot.data ?? [];

        if (plates.isEmpty) {
          return const Center(
            child: Text('No plate listings from users you follow'),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: PlatesListingsGrid(
            itemList: plates,
            shrinkWrap: true,
          ),
        );
      },
    );
  }

  Widget _buildPhoneListingsTab() {
    if (_followingIds.isEmpty) {
      return const Center(child: Text('No users followed yet'));
    }

    return StreamBuilder<List<PhoneListing>>(
      stream: FirebaseFirestore.instance
          .collection(phoneNumbersCollectionId)
          .where('userId', whereIn: _followingIds)
          .where('isDisabled', isEqualTo: false)
          .where('isSold', isEqualTo: false)
          .where('expiresAt', isGreaterThan: DateTime.now())
          .orderBy('createdAt', descending: true)
          .limit(50)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => PhoneListing.fromSnapshot(doc)).toList()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        final phones = snapshot.data ?? [];

        if (phones.isEmpty) {
          return const Center(
            child: Text('No phone listings from users you follow'),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: PhonesListingGrid(
            itemList: phones,
            shrinkWrap: true,
          ),
        );
      },
    );
  }
}
