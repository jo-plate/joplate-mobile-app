import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/strings.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_request_widget.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_request_widget.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_request_grid.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_requests_grid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class UserProfilePage extends StatefulWidget {
  final String userId;

  const UserProfilePage({
    super.key,
    @PathParam('userId') required this.userId,
  });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> with SingleTickerProviderStateMixin {
  late final Stream<UserProfile> userProfileStream;
  int _selectedListingsTabIndex = 0; // 0 for plate listings, 1 for phone listings
  int _selectedRequestsTabIndex = 0; // 0 for plate requests, 1 for phone requests
  int _mainTabIndex = 0; // 0 for listings, 1 for requests
  late TabController _tabController;
  String? _currentUserId;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser?.uid;
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _mainTabIndex = _tabController.index;
      });
    });

    userProfileStream = FirebaseFirestore.instance
        .collection(userProfileCollectionId)
        .doc(widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.exists ? UserProfile.fromJson(snapshot.data()!) : UserProfile.empty());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleFollowPress(bool currentlyFollowing) async {
    try {
      if (_currentUserId == null) {
        if (mounted) {
          AppSnackbar.showError('You must be logged in to follow users');
        }
        return;
      }

      if (currentlyFollowing) {
        // Direct Firestore update to unfollow
        await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).update({
          'followingList': FieldValue.arrayRemove([widget.userId])
        });

        if (mounted) {
          AppSnackbar.showSuccess('Unfollowed user successfully');
        }
      } else {
        // Direct Firestore update to follow
        await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).update({
          'followingList': FieldValue.arrayUnion([widget.userId])
        });

        if (mounted) {
          AppSnackbar.showSuccess('Following user successfully');
        }
      }
    } catch (e) {
      if (mounted) {
        AppSnackbar.showError('Error: ${e.toString()}');
      }
      print('Follow/unfollow error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: StreamBuilder<UserProfile>(
        stream: userProfileStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final userProfile = snapshot.data;
          if (userProfile == null) {
            return const Center(child: Text('User not found'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Profile banner at the top
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProfileBanner(
                    userId: widget.userId,
                    clickable: false,
                    showUploadButton: false,
                    showTicketCount: false,
                    onFollowPressed: _handleFollowPress,
                  ),
                ),

                // Contact buttons (WhatsApp and Call)
                if (widget.userId != _currentUserId && userProfile.phonenumber.isNotEmpty)
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                onTap: () {
                                  launchUrlString("https://wa.me/962${userProfile.phonenumber.substring(1)}",
                                      mode: LaunchMode.externalApplication);
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'WhatsApp',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF981C1E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  final uri = 'tel:+962${userProfile.phonenumber.substring(1)}';
                                  if (await canLaunchUrlString(uri)) {
                                    await launchUrlString(uri);
                                  } else {
                                    throw 'Could not launch dialer';
                                  }
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      obfuscatePhoneNumber(userProfile.phonenumber),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Tabs section below the profile banner
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: m.profile.Numbers),
                    Tab(text: m.profile.Requests),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Colors.grey,
                ),

                const SizedBox(height: 16),

                // Tab content based on selected tab
                _mainTabIndex == 0 ? _buildListingsTab() : _buildRequestsTab(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildListingsTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final m = Localization.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Toggle between plate and phone listings
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF252A41) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                // Plates tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedListingsTabIndex = 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedListingsTabIndex == 0 ? primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          m.home.car_number,
                          style: TextStyle(
                            color: _selectedListingsTabIndex == 0
                                ? Colors.white
                                : isDark
                                    ? Colors.white70
                                    : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Phone numbers tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedListingsTabIndex = 1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedListingsTabIndex == 1 ? primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          m.home.phone_numbers,
                          style: TextStyle(
                            color: _selectedListingsTabIndex == 1
                                ? Colors.white
                                : isDark
                                    ? Colors.white70
                                    : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Display listings based on selected tab
        _selectedListingsTabIndex == 0 ? _buildPlateListings() : _buildPhoneListings(),
      ],
    );
  }

  Widget _buildRequestsTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final m = Localization.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Toggle between plate and phone requests
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF252A41) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                // Plates requests tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedRequestsTabIndex = 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedRequestsTabIndex == 0 ? primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          m.home.car_number,
                          style: TextStyle(
                            color: _selectedRequestsTabIndex == 0
                                ? Colors.white
                                : isDark
                                    ? Colors.white70
                                    : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Phone requests tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedRequestsTabIndex = 1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedRequestsTabIndex == 1 ? primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          m.home.phone_numbers,
                          style: TextStyle(
                            color: _selectedRequestsTabIndex == 1
                                ? Colors.white
                                : isDark
                                    ? Colors.white70
                                    : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Display requests based on selected tab
        _selectedRequestsTabIndex == 0 ? _buildPlateRequests() : _buildPhoneRequests(),
      ],
    );
  }

  Widget _buildPlateListings() {
    return StreamBuilder<List<PlateListing>>(
      stream: FirebaseFirestore.instance
          .collection(carPlatesCollectionId)
          .where('userId', isEqualTo: widget.userId)
          .where('isDisabled', isEqualTo: false)
          .where('isSold', isEqualTo: false)
          .where('expiresAt', isGreaterThan: Timestamp.now())
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => PlateListing.fromSnapshot(doc)).toList()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          // Print error to console to help debug Firebase index issues
          print('ERROR in plate listings: ${snapshot.error}');
          if (snapshot.error is FirebaseException) {
            FirebaseException error = snapshot.error as FirebaseException;
            print('Firebase error code: ${error.code}');
            print('Firebase error message: ${error.message}');

            // Check for index error specifically
            if (error.code == 'failed-precondition' && error.message?.contains('index') == true) {
              print('MISSING INDEX: Please add the required index in Firebase console');
            }
          }

          return SizedBox(
            height: 300,
            child: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        final plateListings = snapshot.data ?? [];

        if (plateListings.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Text('No plate listings found'),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PlatesListingsGrid(
            itemList: plateListings,
          ),
        );
      },
    );
  }

  Widget _buildPhoneListings() {
    return StreamBuilder<List<PhoneListing>>(
      stream: FirebaseFirestore.instance
          .collection(phoneNumbersCollectionId)
          .where('userId', isEqualTo: widget.userId)
          .where('isDisabled', isEqualTo: false)
          .where('isSold', isEqualTo: false)
          .where('expiresAt', isGreaterThan: Timestamp.now())
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => PhoneListing.fromSnapshot(doc)).toList()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          // Print error to console to help debug Firebase index issues
          print('ERROR in phone listings: ${snapshot.error}');
          if (snapshot.error is FirebaseException) {
            FirebaseException error = snapshot.error as FirebaseException;
            print('Firebase error code: ${error.code}');
            print('Firebase error message: ${error.message}');

            // Check for index error specifically
            if (error.code == 'failed-precondition' && error.message?.contains('index') == true) {
              print('MISSING INDEX: Please add the required index in Firebase console');
            }
          }

          return SizedBox(
            height: 300,
            child: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        final phoneListings = snapshot.data ?? [];

        if (phoneListings.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Text('No phone listings found'),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PhonesListingGrid(
            itemList: phoneListings,
          ),
        );
      },
    );
  }

  Widget _buildPlateRequests() {
    return StreamBuilder<List<PlateRequest>>(
      stream: FirebaseFirestore.instance
          .collection(platesRequestsCollectionId)
          .where('userId', isEqualTo: widget.userId)
          .where('isDisabled', isEqualTo: false)
          .where('expiresAt', isGreaterThan: Timestamp.now())
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => PlateRequest.fromSnapshot(doc)).toList()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          // Print error to console to help debug Firebase index issues
          print('ERROR in plate requests: ${snapshot.error}');
          if (snapshot.error is FirebaseException) {
            FirebaseException error = snapshot.error as FirebaseException;
            print('Firebase error code: ${error.code}');
            print('Firebase error message: ${error.message}');

            // Check for index error specifically
            if (error.code == 'failed-precondition' && error.message?.contains('index') == true) {
              print('MISSING INDEX: Please add the required index in Firebase console');
            }
          }

          return SizedBox(
            height: 300,
            child: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        final plateRequests = snapshot.data ?? [];

        if (plateRequests.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Text('No plate requests found'),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PlatesRequestGrid(
            itemList: plateRequests,
          ),
        );
      },
    );
  }

  Widget _buildPhoneRequests() {
    return StreamBuilder<List<PhoneRequest>>(
      stream: FirebaseFirestore.instance
          .collection(phonesRequestsCollectionId)
          .where('userId', isEqualTo: widget.userId)
          .where('isDisabled', isEqualTo: false)
          .where('expiresAt', isGreaterThan: Timestamp.now())
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => PhoneRequest.fromSnapshot(doc)).toList()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          // Print error to console to help debug Firebase index issues
          print('ERROR in phone requests: ${snapshot.error}');
          if (snapshot.error is FirebaseException) {
            FirebaseException error = snapshot.error as FirebaseException;
            print('Firebase error code: ${error.code}');
            print('Firebase error message: ${error.message}');

            // Check for index error specifically
            if (error.code == 'failed-precondition' && error.message?.contains('index') == true) {
              print('MISSING INDEX: Please add the required index in Firebase console');
            }
          }

          return SizedBox(
            height: 300,
            child: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        final phoneRequests = snapshot.data ?? [];

        if (phoneRequests.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Text('No phone requests found'),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PhonesRequestsGrid(
            itemList: phoneRequests,
          ),
        );
      },
    );
  }
}
