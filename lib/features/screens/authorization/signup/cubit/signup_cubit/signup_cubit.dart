import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _repository;
  SignupCubit(this._repository) : super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignUpStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignUpStatus.initial));
  }

  void nameChanged(String value) {
    emit(state.copyWith(name: value, status: SignUpStatus.initial));
  }

  Future<void> signUp() async {
    if (state.status == SignUpStatus.submitting) return;
    emit(state.copyWith(status: SignUpStatus.submitting));
    try {
      final responce = await _repository.onSignUp(
        name: state.name,
        email: state.email,
        password: state.password,
      );
      if (responce.user!.identities!.isEmpty) {
        emit(state.copyWith(status: SignUpStatus.alreadyRegistered));
      } else {
        emit(state.copyWith(status: SignUpStatus.succes));
      }
    } on AuthException catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: SignUpStatus.error));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: SignUpStatus.error));
    }
  }
}
