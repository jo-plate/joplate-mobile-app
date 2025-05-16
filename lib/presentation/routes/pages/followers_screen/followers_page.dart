import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/user_list_item.dart';

@RoutePage()
class FollowersPage extends StatefulWidget {
  final String userId;

  const FollowersPage({
    super.key,
    @PathParam('userId') required this.userId,
  });

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  late Future<List<UserProfile>> _followersFuture;
  late String? _currentUserId;
  bool _isLoading = true;
  String? _errorMessage;
  List<String> _currentUserFollowing = [];
  UserProfile? _currentUserProfile;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser?.uid;
    _loadFollowers();
    _loadCurrentUserProfile();
  }

  Future<void> _loadCurrentUserProfile() async {
    if (_currentUserId != null) {
      try {
        // Direct Firestore call to get current user profile
        final docSnapshot =
            await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).get();

        if (docSnapshot.exists && mounted) {
          _currentUserProfile = UserProfile.fromJson(docSnapshot.data()!);
          setState(() {
            _currentUserFollowing = _currentUserProfile?.followingList ?? [];
          });
        }
      } catch (e) {
        print('Error loading current user profile: $e');
      }
    }
  }

  Future<void> _loadFollowers() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Direct Firestore query to get followers
      _followersFuture = FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .where('followingList', arrayContains: widget.userId)
          .get()
          .then((querySnapshot) {
        return querySnapshot.docs.map((doc) => UserProfile.fromJson(doc.data())).toList();
      });

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load followers: ${e.toString()}';
      });
    }
  }

  Future<void> _handleFollowToggle(String userId, bool isCurrentlyFollowing) async {
    if (_currentUserId == null) {
      AppSnackbar.showError('You must be signed in to follow users');
      return;
    }

    try {
      if (isCurrentlyFollowing) {
        // Direct Firestore update to unfollow
        await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).update({
          'followingList': FieldValue.arrayRemove([userId])
        });

        // Update local state
        setState(() {
          _currentUserFollowing.remove(userId);
        });

        AppSnackbar.showSuccess('Unfollowed user');
      } else {
        // Direct Firestore update to follow
        await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).update({
          'followingList': FieldValue.arrayUnion([userId])
        });

        // Update local state
        setState(() {
          _currentUserFollowing.add(userId);
        });

        AppSnackbar.showSuccess('Following user');
      }
    } catch (e) {
      print('Follow/unfollow error: $e');
      AppSnackbar.showError('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers'),
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
                      ElevatedButton(
                        onPressed: _loadFollowers,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : FutureBuilder<List<UserProfile>>(
                  future: _followersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _loadFollowers,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    final followers = snapshot.data ?? [];

                    if (followers.isEmpty) {
                      return const Center(
                        child: Text(
                          'No followers yet',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: followers.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final user = followers[index];
                        final isFollowing = _currentUserFollowing.contains(user.id);
                        final isCurrentUser = user.id == _currentUserId;

                        return UserListItem(
                          user: user,
                          isFollowing: isFollowing,
                          onTap: () => AutoRouter.of(context).push(UserProfileRoute(userId: user.id)),
                          onFollowPressed: isCurrentUser ? null : () => _handleFollowToggle(user.id, isFollowing),
                          showPlanBadge: true,
                        );
                      },
                    );
                  },
                ),
    );
  }
}
