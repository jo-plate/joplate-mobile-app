import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/domain/dto/login_input.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/domain/repositories/firestore.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  final FirestoreUserRepository _firestoreUserRepository;

  AuthCubit(this._firestoreUserRepository) : super(AuthState.initial());

  Future<void> signUpWithEmailAndPassword(SignupInput input) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final userCredential = await _authService.createUserWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );

      final user = userCredential.user;
      if (user == null) throw Exception('User creation failed');

      await _firestoreUserRepository.createUserProfile(user.uid, input);

      emit(state.copyWith(user: user, isLoading: false));
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _getFirebaseErrorMessage(e),
      ));
    } catch (e) {
      print(e);
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
      await _authService.signOut();
      emit(state.copyWith(user: null, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Logout failed: ${e.toString()}',
      ));
    }
  }

  String _getFirebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'invalid-email':
        return 'Please enter a valid email address';
      case 'operation-not-allowed':
        return 'This operation is not allowed';
      case 'weak-password':
        return 'Password is too weak';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No account found for this email';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return 'Authentication error: ${e.message}';
    }
  }
}
