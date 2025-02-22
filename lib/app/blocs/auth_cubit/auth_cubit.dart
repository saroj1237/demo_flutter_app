import 'dart:developer';

import 'package:demo_flutter_app/core/local_storage/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LocalStorage localStorage;
  AuthCubit(this.localStorage) : super(const AuthState.initial());
  Future<void> checkAuthStatus() async {
    final token = await localStorage
        .getAccessToken(); //Don't remove the await keyword, it's important :)
    log(token.toString());
    if (token != null) {
      emit(const AuthState.authenticated());
    } else {
      emit(const AuthState.unAuthenticated());
    }
  }
}
