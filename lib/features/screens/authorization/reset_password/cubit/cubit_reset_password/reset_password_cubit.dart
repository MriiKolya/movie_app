import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository _repository;
  ResetPasswordCubit({required AuthRepository repository})
      : _repository = repository,
        super(ResetPasswordState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: ResetPasswordStatus.initial));
  }

  Future<void> resetPassword() async {
    if (state.status == ResetPasswordStatus.submitting) return;
    emit(state.copyWith(status: ResetPasswordStatus.submitting));
    try {
      await _repository.onResetPassword(
        email: state.email,
      );
      emit(state.copyWith(status: ResetPasswordStatus.succes));
    } on AuthException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: ResetPasswordStatus.error));
    }
  }
}
