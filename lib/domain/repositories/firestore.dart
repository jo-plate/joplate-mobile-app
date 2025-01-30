import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/domain/entities/user_profile.dart';

@injectable
class FirestoreUserRepository {
  final String _collectionName = 'user_profile';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserProfile(String userId, SignupInput input) async {
    var userProfile =
        UserProfile(displayName: input.displayName, id: userId, email: input.email, phonenumber: input.phonenumber);

    await _firestore.collection(_collectionName).add(userProfile.toMap());
  }

  // Future<UserProfile> updateUserProfile() async {
  // Update user profile
  // }

  // Future<UserProfile> deleteUserProfile() async {
  // Delete user profile
  // }

  // Future<UserProfile> getUserProfile() async {
  // Get user profile
  // }
}
