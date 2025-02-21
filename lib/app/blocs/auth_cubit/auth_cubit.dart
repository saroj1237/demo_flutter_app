import 'package:demo_flutter_app/core/dependency_injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SharedPreferences sp;
  AuthCubit(this.sp) : super(const AuthState.initial());
  void checkAuthStatus() {
    final token = sp.getString('token');
    if (token != null) {
      emit(const AuthState.authenticated());
    } else {
      emit(const AuthState.unAuthenticated());
    }
  }
}
