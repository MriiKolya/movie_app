import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  final AuthRepository _repository;

  CreateNewPasswordCubit({
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

}
