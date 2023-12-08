import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/domain/models/user_model.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository authRepository;
  StreamSubscription<UserAuth?>? _userSubscription;

  AppBloc(this.authRepository) : super(AppState.initial(authRepository)) {
    on<AppInitialCheckRequested>(_onInitialAuthChecked);
    on<AppUserChanged>(_onCurrentUserChanged);
    on<AppLogoutRequasted>(_onLogout);
    _startUserSubscription();
  }

  Future<void> _onInitialAuthChecked(
      AppInitialCheckRequested event, Emitter<AppState> emit) async {
    User? signedInUser = authRepository.getSignedInUser();
    signedInUser != null
        ? emit(AppState.authenticated(
            UserAuth(id: signedInUser.id, email: signedInUser.email)))
        : emit(const AppState.unauthenticated());
  }

  void _startUserSubscription() =>
      _userSubscription = authRepository.getCurrentUser().listen((user) {
        add(AppUserChanged(user));
      });

  Future<void> _onCurrentUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {
    if (event.user != UserAuth.empty) {
      emit(AppState.authenticated(event.user));
    } else {
      emit(const AppState.unauthenticated());
    }
  }

  Future<void> _onLogout(
      AppLogoutRequasted event, Emitter<AppState> emit) async {
    await authRepository.onSignOut();
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
