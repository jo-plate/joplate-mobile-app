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
  String? _currentUserId;
  Stream<List<UserProfile>>? _followersStream;
  Stream<List<String>>? _followingStream;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser?.uid;
    _initStreams();
  }

  void _initStreams() {
    // Stream for followers of the specified user
    _followersStream = FirebaseFirestore.instance
        .collection(userProfileCollectionId)
        .where('followingList', arrayContains: widget.userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UserProfile.fromJson(doc.data())).toList();
    });

    // Stream for the current user's following list
    if (_currentUserId != null) {
      _followingStream = FirebaseFirestore.instance
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
        title: const Text('Followers'),
      ),
      body: _followersStream == null
          ? const Center(child: CircularProgressIndicator())
          : StreamBuilder<List<UserProfile>>(
              stream: _followersStream,
              builder: (context, followersSnapshot) {
                if (followersSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (followersSnapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: ${followersSnapshot.error}',
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

                final followers = followersSnapshot.data ?? [];

                if (followers.isEmpty) {
                  return const Center(
                    child: Text(
                      'No followers yet',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                if (_currentUserId == null || _followingStream == null) {
                  // Display followers without follow button functionality
                  return _buildFollowersList(followers, []);
                }

                return StreamBuilder<List<String>>(
                  stream: _followingStream,
                  builder: (context, followingSnapshot) {
                    final followingList = followingSnapshot.data ?? [];
                    return _buildFollowersList(followers, followingList);
                  },
                );
              },
            ),
    );
  }

  Widget _buildFollowersList(List<UserProfile> followers, List<String> followingList) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: followers.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final user = followers[index];
        final isFollowing = followingList.contains(user.id);
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
  }
}
