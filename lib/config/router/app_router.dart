import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/app_router_redirect.dart';
import 'package:movie_app/core/blocs/bloc/app_bloc.dart';
import 'package:movie_app/features/profile/profile_screen.dart';
import 'package:movie_app/features/screens/authorization/login/view/login_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/create_new_password_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/reset_password_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/verification_reset_password_screen.dart';
import 'package:movie_app/features/screens/authorization/signup/view/signup_screen.dart';
import 'package:movie_app/features/screens/authorization/signup/view/verification_signup_.dart';
import 'package:movie_app/features/screens/navigation/view/navigation.dart';
import 'package:movie_app/features/screens/dashboard/dashboard.dart';
import 'package:movie_app/features/search/search_screen.dart';

import 'app_router_name.dart';

class AppRouter {
  final AppBloc _authBloc;
  AppRouter({
    required AppBloc authBloc,
  }) : _authBloc = authBloc;

  static final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  static final _rootNavigatorSearch =
      GlobalKey<NavigatorState>(debugLabel: 'shellSearch');

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    initialLocation: '/dashboard',
    redirect: (context, state) =>
        appRedirect(context: context, state: state, authBloc: _authBloc),
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return NavigationScreen(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey:
                  GlobalKey<NavigatorState>(debugLabel: 'shellDasboard'),
              routes: [
                GoRoute(
                  path: '/dashboard',
                  name: AppNameRouter.dashboardRouteName,
                  builder: (BuildContext contex, GoRouterState state) =>
                      DashboardScreen(
                    key: state.pageKey,
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigatorSearch,
              routes: [
                GoRoute(
                  path: '/search',
                  name: AppNameRouter.searchRouteName,
                  builder: (BuildContext contex, GoRouterState state) =>
                      SearchScreen(
                    key: state.pageKey,
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigatorProfile,
              routes: [
                GoRoute(
                  path: '/profile',
                  name: AppNameRouter.profileRouteName,
                  builder: (BuildContext contex, GoRouterState state) =>
                      ProfileScreen(key: state.pageKey),
                )
              ],
            )
          ]),
      GoRoute(
        path: '/login',
        name: AppNameRouter.loginRouteName,
        builder: (BuildContext contex, GoRouterState state) => LoginnScreen(),
      ),
      GoRoute(
        path: '/create_new_password',
        name: AppNameRouter.createNewPasswordRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: '/reset_password',
        name: AppNameRouter.resetPasswordRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            ReserPasswordScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: AppNameRouter.signUpRouteName,
        builder: (BuildContext contex, GoRouterState state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/verification_reset_password',
        name: AppNameRouter.verificationResetPasswordRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            const VerificationResetPasswordScreen(),
      ),
      GoRoute(
        path: '/verification_signup',
        name: AppNameRouter.verificationSignUpRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            const VerificationSignUplScreen(),
      ),
    ],
    refreshListenable: GoRouterRefreshStream(_authBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    subscription =
        stream.asBroadcastStream().listen((event) => notifyListeners());
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
