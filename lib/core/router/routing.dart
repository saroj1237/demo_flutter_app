import 'package:demo_flutter_app/core/dependency_injection/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const home = '/';
  static const counter = '/counter';
  static const login = '/login';
}

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
      GoRoute(
      path: AppRoutes.home,
      name: 'Home',
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: Text(getIt.get<Dio>().options.baseUrl),),
      ),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: 'Login',
      builder: (context, state) => Container(),
    ),
  ],
);
