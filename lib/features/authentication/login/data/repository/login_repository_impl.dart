import 'package:demo_flutter_app/core/exceptions/failures.dart';
import 'package:demo_flutter_app/core/exceptions/network_exceptions.dart';
import 'package:demo_flutter_app/features/authentication/login/data/data_source/local_data_source.dart';
import 'package:demo_flutter_app/features/authentication/login/data/data_source/remote_data_source.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_response.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/repository/login_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.localDataSource, {required this.remoteDataSource});
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  @override
  Future<Either<Failure, LoginResponse>> login(
    String username,
    String password,
  ) async {
    try {
      final loginResponse = await remoteDataSource.login(username, password);
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
