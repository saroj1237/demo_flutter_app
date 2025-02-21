import 'package:demo_flutter_app/core/dependency_injection/injection.dart';
import 'package:demo_flutter_app/features/authentication/login/presentation/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: const Center(child: Text('Login Page')),
      ),
    );
  }
}
