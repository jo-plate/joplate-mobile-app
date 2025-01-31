import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/domain/entities/user_profile.dart';

@injectable
class FirestoreUserRepository {
  final String _collectionName = 'user_profiles';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserProfile userProfile = UserProfile.empty();
  
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

  Future<UserProfile> getUserProfile(String userId) async {
    var snapshot = await _firestore.collection(_collectionName).doc(userId).get();
    var data = snapshot.data()!;

    return UserProfile(
      displayName: data['displayName'],
      id: data['id'],
      email: data['email'],
      phonenumber: data['phonenumber'],
    );
  }
}
