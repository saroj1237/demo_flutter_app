part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginResponse response) = _Success;
  const factory LoginState.failure(Failure failure) = _Failure;
}
