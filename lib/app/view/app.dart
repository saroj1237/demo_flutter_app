import 'dart:developer';

import 'package:demo_flutter_app/app/blocs/auth_cubit/auth_cubit.dart';
import 'package:demo_flutter_app/core/dependency_injection/injection.dart';
import 'package:demo_flutter_app/core/router/routing.dart';
import 'package:demo_flutter_app/features/counter/counter.dart';
import 'package:demo_flutter_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthCubit>()..checkAuthStatus(),
          lazy: false,
        ),
        BlocProvider(create: (context) => getIt<CounterCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          state.maybeWhen(
            authenticated: () => context.go(AppRoutes.home),
            unAuthenticated: () => context.go(AppRoutes.login),
            orElse: () => context.go(AppRoutes.login),
          );
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
