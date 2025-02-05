import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/domain/entities/user_profile.dart';

@singleton
class FirestoreUserRepository {
  final String _collectionName = 'user_profiles';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<UserProfile>? _userProfileStream;
  String? _currentUserId;


  Stream<UserProfile> get userProfileStream {
    _userProfileStream ??= _createProfileStream();
    return _userProfileStream!;
  }

  Stream<UserProfile> _createProfileStream() async* {
    if (_currentUserId == null) {
      throw Exception('User ID not initialized');
    }

    yield* _firestore.collection(_collectionName).doc(_currentUserId).snapshots().handleError((error) {
      throw FirebaseException(
        plugin: 'user_profile',
        message: 'Error fetching user profile',
        code: error.code,
      );
    }).asyncMap((snapshot) {
      if (!snapshot.exists) return UserProfile.empty();
      return UserProfile.fromMap(snapshot.data()!);
    });
  }

  Future<void> initUserStream(String userId) async {
    _currentUserId = userId;
  }

  Future<void> createUserProfile(String userId, SignupInput input) async {
    final userProfile = UserProfile(
      displayName: input.displayName,
      id: userId,
      email: input.email,
      phonenumber: input.phonenumber,
    );

    await _firestore.collection(_collectionName).doc(userId).set(userProfile.toMap());
  }

  Future<UserProfile> updateUserProfile(UserProfile updatedProfile) async {
    await _firestore.collection(_collectionName).doc(updatedProfile.id).update(updatedProfile.toMap());

    return updatedProfile;
  }

  Future<void> deleteUserProfile(String userId) async {
    await _firestore.collection(_collectionName).doc(userId).delete();
  }

  Future<UserProfile> getUserProfile(String userId) async {
    final snapshot = await _firestore.collection(_collectionName).doc(userId).get();

    if (!snapshot.exists) {
      return UserProfile.empty();
    }

    return UserProfile.fromMap(snapshot.data()!);
  }

  void dispose() {
    _userProfileStream = null;
    _currentUserId = null;
  }
}
