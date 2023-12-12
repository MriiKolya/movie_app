part of 'signup_cubit.dart';

enum SignUpStatus { initial, submitting, succes, error , alreadyRegistered }

class SignupState extends Equatable {
  final String email;
  final String password;
  final String name;
  final SignUpStatus status;
  const SignupState(
      {required this.email,
      required this.password,
      required this.name,
      required this.status});

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      name: '',
      status: SignUpStatus.initial,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    String? name,
    SignUpStatus? status,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, name, password, status];
}
