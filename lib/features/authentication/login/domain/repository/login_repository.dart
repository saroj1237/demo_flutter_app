import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> login(
      String username, String password);
}
