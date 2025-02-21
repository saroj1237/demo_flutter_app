// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/authentication/login/data/data_source/local_data_source.dart'
    as _i172;
import '../../features/authentication/login/data/data_source/remote_data_source.dart'
    as _i971;
import '../../features/authentication/login/data/repository/login_repository_impl.dart'
    as _i352;
import '../../features/authentication/login/domain/repository/login_repository.dart'
    as _i403;
import '../../features/authentication/login/domain/usecases/login_usecase.dart'
    as _i532;
import '../network/api_service.dart' as _i921;
import '../network/dio_interceptiors.dart' as _i612;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<List<_i361.Interceptor>>(() => registerModule.interceptors);
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i612.ErrorHandlerInterceptor>(
        () => _i612.ErrorHandlerInterceptor(gh<_i460.SharedPreferences>()));
    gh.factory<_i612.TokenInterceptor>(
        () => _i612.TokenInterceptor(gh<_i460.SharedPreferences>()));
    gh.factory<_i921.ApiService>(() => _i921.ApiService(
          gh<_i361.Dio>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.lazySingleton<_i971.RemoteDataSource>(
        () => _i971.RemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i403.LoginRepository>(() => _i352.LoginRepositoryImpl(
          gh<_i172.LocalDataSource>(),
          remoteDataSource: gh<_i971.RemoteDataSource>(),
        ));
    gh.lazySingleton<_i532.LoginUseCase>(
        () => _i532.LoginUseCase(gh<_i403.LoginRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
