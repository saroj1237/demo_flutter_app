import 'package:demo_flutter_app/core/network/api_service.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_request.dart';
import 'package:demo_flutter_app/features/authentication/login/domain/models/login_response.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this.apiService);
  final ApiService apiService;
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await apiService.post(
        '/auth/login',
        data: request.toJson(),
      );
      final loginResponse =
          LoginResponse.fromJson(response.data as Map<String, dynamic>);
      return loginResponse;
    } catch (e) {
      rethrow;
    }
  }
}
