part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitialCheckRequested extends AppEvent {}

class AppLogoutRequasted extends AppEvent {}

class AppUserChanged extends AppEvent {
  final UserAuth user;
  const AppUserChanged(this.user);
  @override
  List<Object> get props => [user];
}
