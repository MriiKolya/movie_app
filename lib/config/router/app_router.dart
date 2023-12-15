import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/config/router/app_router_redirect.dart';
import 'package:movie_app/core/blocs/app_bloc/app_bloc.dart';
import 'package:movie_app/features/screens/main/favorite/favorite_screen.dart';
import 'package:movie_app/features/screens/main/profile/profile_screen.dart';
import 'package:movie_app/features/screens/authorization/login/view/login_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/create_new_password_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/reset_password_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/verification_reset_password_screen.dart';
import 'package:movie_app/features/screens/authorization/signup/view/signup_screen.dart';
import 'package:movie_app/features/screens/authorization/signup/view/verification_signup_.dart';
import 'package:movie_app/features/screens/main/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:movie_app/features/screens/main/dashboard/view/dashboard_screen.dart';
import 'package:movie_app/features/screens/main/search/search_screen.dart';

import 'app_router_name.dart';

class AppRouter {
  final AppBloc _authBloc;
  AppRouter({
    required AppBloc authBloc,
  }) : _authBloc = authBloc;

  final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
  final _rootNavigatorDasboard =
      GlobalKey<NavigatorState>(debugLabel: 'shellDasboard');
  final _rootNavigatorSearch =
      GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
  final _rootNavigatorfavorite =
      GlobalKey<NavigatorState>(debugLabel: 'shellSearch');

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    initialLocation: '/profile',
    redirect: (context, state) =>
        appRedirect(context: context, state: state, authBloc: _authBloc),
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _rootNavigatorDasboard,
            routes: [
              GoRoute(
                path: '/dashboard',
                name: RouteConstants.dashboardName,
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
                name: RouteConstants.searchRouteName,
                builder: (BuildContext contex, GoRouterState state) =>
                    SearchScreen(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorfavorite,
            routes: [
              GoRoute(
                path: '/favorite',
                name: RouteConstants.favoriteRouteName,
                builder: (BuildContext contex, GoRouterState state) =>
                    FavoriteScreen(
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
                name: RouteConstants.profileRouteName,
                builder: (BuildContext contex, GoRouterState state) =>
                    ProfileScreen(key: state.pageKey),
              )
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: RouteConstants.loginRouteName,
        builder: (BuildContext contex, GoRouterState state) => LoginnScreen(),
      ),
      GoRoute(
        path: '/create_new_password',
        name: RouteConstants.createNewPasswordRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: '/reset_password',
        name: RouteConstants.resetPasswordRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            ReserPasswordScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: RouteConstants.signUpRouteName,
        builder: (BuildContext contex, GoRouterState state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/verification_reset_password',
        name: RouteConstants.verificationResetPasswordRouteName,
        builder: (BuildContext contex, GoRouterState state) =>
            const VerificationResetPasswordScreen(),
      ),
      GoRoute(
        path: '/verification_signup',
        name: RouteConstants.verificationSignUpRouteName,
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
