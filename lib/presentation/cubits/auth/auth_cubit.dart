import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  AuthCubit(this._firestoreUserRepository) : super(const AuthState());

  Future<void> signUpWithEmailAndPassword(SignupInput input) async {
    try {
      final user = await _authService.createUserWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );
      await _firestoreUserRepository.createUserProfile(user.user!.uid, input);

      emit(state.copyWith(user: _authService.currentUser));
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginWithEmailAndPassword(LoginInput input) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );
      emit(state.copyWith(user: _authService.currentUser));
    } catch (e) {
      print(e);
    }
  }

//anonymous login
  Future<void> loginAnonymously() async {
    try {
      await _authService.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {}
}
