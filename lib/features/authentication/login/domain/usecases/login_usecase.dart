import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/core/usecases/base_usecase.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_request.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_response.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/repository/login_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginUseCase implements UseCase<LoginResponse, LoginRequest> {
  LoginUseCase(this.loginRepository);

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, LoginResponse>> call(LoginRequest params) {
    return loginRepository.login(params);
  }
}
