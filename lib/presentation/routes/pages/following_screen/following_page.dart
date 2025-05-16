import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/user_list_item.dart';

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
  late Future<List<UserProfile>> _followingFuture;
  bool _isLoading = true;
  String? _errorMessage;
  String? _currentUserId;
  List<String> _currentUserFollowing = [];

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser?.uid;
    _loadFollowing();
    if (_currentUserId != null) {
      _loadCurrentUserFollowing();
    }
  }

  Future<void> _loadCurrentUserFollowing() async {
    try {
      final docSnapshot =
          await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).get();

      if (docSnapshot.exists && mounted) {
        final data = docSnapshot.data();
        if (data != null && data['followingList'] != null) {
          setState(() {
            _currentUserFollowing = List<String>.from(data['followingList']);
          });
        }
      }
    } catch (e) {
      print('Error loading current user following: $e');
    }
  }

  Future<void> _loadFollowing() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Get user profile to access the followingList
      final userDoc = await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).get();

      if (!userDoc.exists) {
        setState(() {
          _isLoading = false;
          _followingFuture = Future.value([]);
        });
        return;
      }

      final userData = userDoc.data();
      if (userData == null) {
        setState(() {
          _isLoading = false;
          _followingFuture = Future.value([]);
        });
        return;
      }

      final followingList = userData['followingList'];
      if (followingList == null || (followingList as List).isEmpty) {
        setState(() {
          _isLoading = false;
          _followingFuture = Future.value([]);
        });
        return;
      }

      // If there are many users being followed, we need to batch the queries
      // Firestore has a limit of 10 items for 'whereIn' queries
      final List<String> followingIds = List<String>.from(followingList);
      final batchSize = 10;
      final batches = <List<String>>[];

      for (var i = 0; i < followingIds.length; i += batchSize) {
        final end = (i + batchSize < followingIds.length) ? i + batchSize : followingIds.length;
        batches.add(followingIds.sublist(i, end));
      }

      // Execute batch queries and combine results
      _followingFuture = Future.wait(batches.map((batch) => FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .where(FieldPath.documentId, whereIn: batch)
          .get()
          .then((snapshot) => snapshot.docs.map((doc) => UserProfile.fromJson(doc.data())).toList()))).then((results) {
        // Flatten the list of lists
        return results.expand((profiles) => profiles).toList();
      });

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading following: $e');
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load following: ${e.toString()}';
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
        title: const Text('Following'),
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
                        onPressed: _loadFollowing,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : FutureBuilder<List<UserProfile>>(
                  future: _followingFuture,
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
                              onPressed: _loadFollowing,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    final following = snapshot.data ?? [];

                    if (following.isEmpty) {
                      return const Center(
                        child: Text(
                          'Not following anyone yet',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: following.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final user = following[index];
                        final isFollowing = _currentUserFollowing.contains(user.id);
                        final isCurrentUser = user.id == _currentUserId;

                        return UserListItem(
                          user: user,
                          isFollowing: isFollowing,
                          onTap: () {
                            // Navigate to user profile
                            AutoRouter.of(context).push(UserProfileRoute(userId: user.id));
                          },
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
