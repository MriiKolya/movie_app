import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_reset_password/reset_password_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  final AuthRepository _repository;
  final ResetPasswordCubit resetPasswordCubit;

  CreateNewPasswordCubit({
    required this.resetPasswordCubit,
    required AuthRepository repository,
  })  : _repository = repository,
        super(CreateNewPasswordState.initial());

  void newPasswordChanged(String value) {
    emit(state.copyWith(
        newPassword: value, status: CreateNewPasswordStatus.initial));
  }

  void rePasswordChanged(String value) {
    emit(state.copyWith(
        rePassword: value, status: CreateNewPasswordStatus.initial));
  }

  void updatePassword() {
    if (state.newPassword == state.rePassword) {
      try {
        _repository.onUpdateUser(
            email: resetPasswordCubit.state.email, password: state.newPassword);
        emit(state.copyWith(status: CreateNewPasswordStatus.succes));
      } on AuthException catch (e) {
        debugPrint(e.toString());
        emit(state.copyWith(status: CreateNewPasswordStatus.error));
      } catch (e) {
        emit(state.copyWith(status: CreateNewPasswordStatus.error));
        debugPrint(e.toString());
      }
    } else {
      emit(state.copyWith(status: CreateNewPasswordStatus.error));
    }
  }
}
