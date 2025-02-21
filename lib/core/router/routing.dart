import 'package:demo_flutter_app/app/app.dart';
import 'package:demo_flutter_app/app/blocs/auth_cubit/auth_cubit.dart';
import 'package:demo_flutter_app/core/dependency_injection/injection.dart';
import 'package:demo_flutter_app/features/authentication/login/presentation/pages/login_page.dart';
import 'package:demo_flutter_app/features/counter/counter.dart';
import 'package:demo_flutter_app/features/home/home_view.dart';
import 'package:demo_flutter_app/features/home/landing_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'counter');

class AppRoutes {
  static const initial = '/';
  static const home = '/home';
  static const counter = '/counter';
  static const login = '/login';
}

GoRouter router = GoRouter(
  debugLogDiagnostics: true, // Enable logging of diagnostics
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.initial,
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return LandingPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            // HOME
            GoRoute(
              path: AppRoutes.home,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeView(),
              ),
            ),
          ],
        ),
        // POSTS
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: AppRoutes.counter,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: Center(child: CounterPage()),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.initial,
      name: AppRoutes.initial,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) => LoginPage(),
    ),
  ],
);
