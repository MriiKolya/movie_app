part of 'create_new_password_cubit.dart';

enum CreateNewPasswordStatus { initial, error, succes, submitting }

class CreateNewPasswordState extends Equatable {
  const CreateNewPasswordState(
      {required this.newPassword,
      required this.rePassword,
      required this.status});

  final String newPassword;
  final String rePassword;
  final CreateNewPasswordStatus status;

  factory CreateNewPasswordState.initial() {
    return const CreateNewPasswordState(
      newPassword: '',
      rePassword: '',
      status: CreateNewPasswordStatus.initial,
    );
  }
  CreateNewPasswordState copyWith({
    String? newPassword,
    String? rePassword,
    CreateNewPasswordStatus? status,
  }) {
    return CreateNewPasswordState(
      rePassword: rePassword ?? this.rePassword,
      newPassword: newPassword ?? this.newPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [newPassword, rePassword, status];
}
