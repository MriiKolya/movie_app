part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  final AppStatus status;
  final UserAuth user;

  const AppState._({
    required this.status,
    this.user = UserAuth.empty,
  });

  const AppState.authenticated(UserAuth user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );
  const AppState.unauthenticated()
      : this._(
          status: AppStatus.unauthenticated,
        );
  factory AppState.initial(AuthRepository repository) {
    final User? signedInUser = repository.getSignedInUser();
    final AppStatus initialStatus = signedInUser != null
        ? AppStatus.authenticated
        : AppStatus.unauthenticated;

    return AppState._(
      status: initialStatus,
      user: signedInUser != null
          ? UserAuth(id: signedInUser.id, email: signedInUser.email)
          : UserAuth.empty,
    );
  }

  @override
  List<Object> get props => [status, user];
}
