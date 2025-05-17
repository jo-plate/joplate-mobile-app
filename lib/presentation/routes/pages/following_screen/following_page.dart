import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/user_list_item.dart';
import 'package:rxdart/rxdart.dart';

@RoutePage()
class FollowingPage extends StatefulWidget {
  final String userId;

  const FollowingPage({
    super.key,
    @PathParam('userId') required this.userId,
  });

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  String? _currentUserId;
  Stream<List<String>>? _userFollowingIdsStream;
  Stream<List<String>>? _currentUserFollowingStream;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser?.uid;
    _initStreams();
  }

  void _initStreams() {
    // Stream for the displayed user's followingList
    _userFollowingIdsStream =
        FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data()!;
        if (data['followingList'] != null) {
          return List<String>.from(data['followingList']);
        }
      }
      return <String>[];
    });

    // Stream for the current user's followingList (for the follow/unfollow button state)
    if (_currentUserId != null) {
      _currentUserFollowingStream = FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .doc(_currentUserId)
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          final data = snapshot.data()!;
          if (data['followingList'] != null) {
            return List<String>.from(data['followingList']);
          }
        }
        return <String>[];
      });
    }
  }

  Future<void> _handleFollowToggle(String userId, bool isCurrentlyFollowing) async {
    if (_currentUserId == null) {
      AppSnackbar.showError('You must be signed in to follow users');
      return;
    }

    try {
      final userRef = FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId);
      
      if (isCurrentlyFollowing) {
        // Unfollow user
        await userRef.update({
          'followingList': FieldValue.arrayRemove([userId])
        });
        AppSnackbar.showSuccess('Unfollowed user');
      } else {
        // Follow user
        await userRef.update({
          'followingList': FieldValue.arrayUnion([userId])
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
        title: const Text('Following'),
      ),
      body: _userFollowingIdsStream == null
          ? const Center(child: CircularProgressIndicator())
          : StreamBuilder<List<String>>(
              stream: _userFollowingIdsStream,
              builder: (context, followingIdsSnapshot) {
                if (followingIdsSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (followingIdsSnapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: ${followingIdsSnapshot.error}',
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => setState(() => _initStreams()),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                final followingIds = followingIdsSnapshot.data ?? [];

                if (followingIds.isEmpty) {
                  return const Center(
                    child: Text(
                      'Not following anyone yet',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                // Use a stream builder to fetch all the user profiles of the people being followed
                return StreamBuilder<List<UserProfile>>(
                  stream: _fetchUserProfiles(followingIds),
                  builder: (context, profilesSnapshot) {
                    if (profilesSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (profilesSnapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error loading profiles: ${profilesSnapshot.error}',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => setState(() => _initStreams()),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    final profiles = profilesSnapshot.data ?? [];

                    if (_currentUserId == null || _currentUserFollowingStream == null) {
                      // If not logged in, just show the profiles without follow button functionality
                      return _buildFollowingList(profiles, []);
                    }

                    // Get the current user's following list for the follow button states
                    return StreamBuilder<List<String>>(
                      stream: _currentUserFollowingStream,
                      builder: (context, currentFollowingSnapshot) {
                        final currentFollowingList = currentFollowingSnapshot.data ?? [];
                        return _buildFollowingList(profiles, currentFollowingList);
                      },
                    );
                  },
                );
              },
            ),
    );
  }

  Stream<List<UserProfile>> _fetchUserProfiles(List<String> userIds) {
    if (userIds.isEmpty) {
      return Stream.value([]);
    }

    // Firestore has a limit of 10 items for 'whereIn' queries
    // Split into batches if needed
    const batchSize = 10;
    final batches = <List<String>>[];

    for (var i = 0; i < userIds.length; i += batchSize) {
      final end = (i + batchSize < userIds.length) ? i + batchSize : userIds.length;
      batches.add(userIds.sublist(i, end));
    }

    // Create a stream for each batch and merge them
    final streams = batches.map((batch) {
      return FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .where(FieldPath.documentId, whereIn: batch)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => UserProfile.fromJson(doc.data())).toList());
    }).toList();

    // If there's only one batch, return its stream directly
    if (streams.length == 1) {
      return streams.first;
    }

    // Otherwise, merge all streams with Rx.combineLatest
    return Rx.combineLatestList(streams).map((results) {
      // Flatten the list of lists
      return results.expand((profiles) => profiles).toList();
    });
  }

  Widget _buildFollowingList(List<UserProfile> profiles, List<String> currentUserFollowingList) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: profiles.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final user = profiles[index];
        final isFollowing = currentUserFollowingList.contains(user.id);
        final isCurrentUser = user.id == _currentUserId;

        return UserListItem(
          user: user,
          isFollowing: isFollowing,
          onTap: () {
            AutoRouter.of(context).push(UserProfileRoute(userId: user.id));
          },
          onFollowPressed: isCurrentUser ? null : () => _handleFollowToggle(user.id, isFollowing),
          showPlanBadge: true,
        );
      },
    );
  }
}
