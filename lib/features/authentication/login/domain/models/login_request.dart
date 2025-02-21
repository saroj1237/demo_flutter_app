import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String username,
    required String password,
  }) = _LoginRequest;

}
