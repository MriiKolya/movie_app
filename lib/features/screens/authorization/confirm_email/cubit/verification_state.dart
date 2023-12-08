part of 'verification_cubit.dart';

enum VerificationStatus { initial, succes, error, submitting }

enum CodeStatus { initial, codesend }

class VerificationState extends Equatable {
  final String email;
  final String token;
  final VerificationStatus status;
  final CodeStatus codeStatus;
  const VerificationState({
    required this.email,
    required this.token,
    required this.status,
    required this.codeStatus,
  });

  factory VerificationState.initial() {
    return const VerificationState(
      email: '',
      token: '',
      codeStatus: CodeStatus.initial,
      status: VerificationStatus.initial,
    );
  }

  VerificationState copyWith({
    String? email,
    String? token,
    VerificationStatus? status,
    CodeStatus? codeStatus,
  }) {
    return VerificationState(
      codeStatus: codeStatus ?? this.codeStatus,
      email: email ?? this.email,
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, token, status, codeStatus];
}
