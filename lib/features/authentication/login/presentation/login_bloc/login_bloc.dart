import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_request.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_response.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const LoginState.loading());
      final failureOrSuccess = await loginUseCase(
        LoginRequest(
          username: event.username,
          password: event.password,
        ),
      );
      failureOrSuccess.fold(
        (failure) => emit(LoginState.failure(failure)),
        (response) => emit(LoginState.success(response)),
      );
    });
  }
}
