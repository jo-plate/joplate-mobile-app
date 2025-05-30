import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/login_input.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/domain/repositories/firestore_user_repository.dart';
import 'package:joplate/injection/injector.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  final FirestoreUserRepository _firestoreUserRepository;
  final FirebaseAnalytics _analytics = injector();

  AuthCubit(this._firestoreUserRepository) : super(AuthState.initial()) {
    if (_authService.currentUser?.isAnonymous == true) {
      logout();
    }
    if (_authService.currentUser != null) {
      _initAuthStateListener(_authService.currentUser!.uid);

      _firestoreUserRepository
          .getUserProfile(_authService.currentUser!.uid)
          .then((value) => emit(state.copyWith(user: _authService.currentUser, userProfile: value)));
    }
  }

  Future<void> _initAuthStateListener(String userId) async {
    _authService.authStateChanges().listen((user) async {
      if (user == state.user) return;
      if (user != null) {
        final userProfile = await _firestoreUserRepository.getUserProfile(user.uid);
        await _analytics.setUserId(id: user.uid);

        await _analytics.setUserProperty(name: 'email', value: user.email);
        await _analytics.setUserProperty(name: 'name', value: userProfile.displayName);
        await _analytics.setUserProperty(name: 'phone', value: userProfile.phonenumber);

        emit(state.copyWith(user: user, userProfile: userProfile));
      } else {
        emit(state.copyWith(user: null, userProfile: null));
      }
    });
  }

  Future<void> signUpWithEmailAndPassword(SignupInput input) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      // Call Cloud Function to create user profile
      final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(signupCF);
      final result = await callable.call(input.toJson());

      if (result.data != null && result.data['success'] == true) {
        await loginWithEmailAndPassword(input.toLoginInput());
        emit(state.copyWith(user: FirebaseAuth.instance.currentUser, isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: "Signup failed."));
      }
    } on FirebaseFunctionsException catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.message));
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false, errorMessage: "An unexpected error occurred."));
    }
  }

  Future<void> loginWithEmailAndPassword(LoginInput input) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final userCredential = await _authService.signInWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );
      final userProfile = await _firestoreUserRepository.getUserProfile(userCredential.user!.uid);

      emit(state.copyWith(
        user: userCredential.user,
        userProfile: userProfile,
        isLoading: false,
      ));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _getFirebaseErrorMessage(e),
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred',
      ));
    }
  }

  Future<void> logout() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      _authService.signOut();

      emit(state.copyWith(
        user: null,
        userProfile: null,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Logout failed: ${e.toString()}',
      ));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      // Send a password reset email with a code
      await _authService.sendPasswordResetEmail(
        email: email,
        // Force in-app handling so the email contains a code you can extract
        actionCodeSettings: ActionCodeSettings(
          handleCodeInApp: true,
          url: 'https://joplate.page.link/reset',
          androidPackageName: 'com.joplate.app',
          iOSBundleId: 'com.joplate.joplate',
        ),
      );

      emit(state.copyWith(isLoading: false));
      return;
    } on FirebaseAuthException catch (e) {
      print(e);
      print(e.message);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _getFirebaseErrorMessage(e),
      ));
      rethrow;
    } catch (e) {
      print(e);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Password reset failed: ${e.toString()}',
      ));
      rethrow;
    }
  }

  Future<void> verifyPasswordResetCode(String code) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      // Verify the action code is valid
      await _authService.verifyPasswordResetCode(code);

      emit(state.copyWith(isLoading: false));
      return;
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _getFirebaseErrorMessage(e),
      ));
      rethrow;
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Code verification failed: ${e.toString()}',
      ));
      rethrow;
    }
  }

  Future<void> confirmPasswordReset(String code, String newPassword) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      // Confirm the password reset with the new password
      await _authService.confirmPasswordReset(code: code, newPassword: newPassword);

      emit(state.copyWith(isLoading: false));
      return;
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _getFirebaseErrorMessage(e),
      ));
      rethrow;
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Password reset failed: ${e.toString()}',
      ));
      rethrow;
    }
  }

  Future<void> sendVerifyNewEmailCode(String newEmail) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      _authService.currentUser?.sendEmailVerification();

      emit(state.copyWith(
        isLoading: false,
      ));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _getFirebaseErrorMessage(e),
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Email verification failed: ${e.toString()}',
      ));
    }
  }

  String _getFirebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'network-request-failed':
        return 'No internet connection';
      case 'email-already-in-use':
        return 'Email already registered';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password too weak';
      case 'user-not-found':
        return 'Account not found';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return 'Authentication error: ${e.message}';
    }
  }
}
