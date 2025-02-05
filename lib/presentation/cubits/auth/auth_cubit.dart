import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/domain/dto/login_input.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/domain/repositories/firestore_user_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  final FirestoreUserRepository _firestoreUserRepository;

  AuthCubit(this._firestoreUserRepository) : super(AuthState.initial()) {
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
        emit(state.copyWith(user: user, userProfile: userProfile));
      } else {
        emit(state.copyWith(user: null, userProfile: null));
      }
    });
  }

  Future<void> signUpWithEmailAndPassword(SignupInput input) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final userCredential = await _authService.createUserWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );

      final user = userCredential.user!;
      await _firestoreUserRepository.createUserProfile(user.uid, input);

      emit(state.copyWith(user: user, isLoading: false));
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

  Future<void> loginAnonymously() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final userCredential = await _authService.signInAnonymously();
      emit(state.copyWith(
        user: userCredential.user,
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
