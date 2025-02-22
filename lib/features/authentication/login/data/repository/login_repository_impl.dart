import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/core/exceptions/network_exceptions.dart';
import 'package:demo_flutter_app/core/local_storage/local_storage.dart';
import 'package:demo_flutter_app/features/authentication/login/data/data_source/remote_data_source.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_request.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_response.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/repository/login_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(
      {required this.remoteDataSource, required this.localStorage});
  final RemoteDataSource remoteDataSource;
  final LocalStorage localStorage;
  @override
  Future<Either<Failure, LoginResponse>> login(
    LoginRequest request,
  ) async {
    try {
      final loginResponse = await remoteDataSource.login(request);
      // Save token to local storage
      await localStorage.setAccessToken(loginResponse.accessToken);
      return right(loginResponse);
    } catch (e) {
      return left(
        NetworkFailure(
          NetworkExceptions.getErrorMessage(
            NetworkExceptions.getException(e),
          ),
        ),
      );
    }
  }
}
