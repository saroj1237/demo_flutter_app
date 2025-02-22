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

import '../../app/blocs/auth_cubit/auth_cubit.dart' as _i481;
import '../../features/authentication/login/data/data_source/remote_data_source.dart'
    as _i971;
import '../../features/authentication/login/data/repository/login_repository_impl.dart'
    as _i352;
import '../../features/authentication/login/domain/repository/login_repository.dart'
    as _i403;
import '../../features/authentication/login/domain/usecases/login_usecase.dart'
    as _i532;
import '../../features/authentication/login/presentation/login_bloc/login_bloc.dart'
    as _i277;
import '../../features/products/data/datasource/product_local_data_source.dart'
    as _i371;
import '../../features/products/data/datasource/product_remote_data_source.dart'
    as _i881;
import '../../features/products/data/repository/product_repository_impl.dart'
    as _i554;
import '../../features/products/domain/repository/products_repository.dart'
    as _i822;
import '../../features/products/domain/usecases/products_usecase.dart' as _i841;
import '../../features/products/presentation/bloc/products_bloc.dart' as _i975;
import '../local_storage/local_storage.dart' as _i226;
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
    gh.lazySingleton<_i371.ProductLocalDataSource>(
        () => _i371.ProductLocalDataSourceImpl());
    gh.lazySingleton<_i226.LocalStorage>(
        () => _i226.LocalStorage(gh<_i460.SharedPreferences>()));
    gh.factory<_i481.AuthCubit>(
        () => _i481.AuthCubit(gh<_i226.LocalStorage>()));
    gh.factory<_i921.ApiService>(() => _i921.ApiService(
          gh<_i361.Dio>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.lazySingleton<_i971.RemoteDataSource>(
        () => _i971.RemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i403.LoginRepository>(() => _i352.LoginRepositoryImpl(
          remoteDataSource: gh<_i971.RemoteDataSource>(),
          localStorage: gh<_i226.LocalStorage>(),
        ));
    gh.lazySingleton<_i881.ProductRemoteDataSource>(() =>
        _i881.ProductRemoteDataSourceImpl(apiService: gh<_i921.ApiService>()));
    gh.lazySingleton<_i532.LoginUseCase>(
        () => _i532.LoginUseCase(gh<_i403.LoginRepository>()));
    gh.lazySingleton<_i822.ProductsRepository>(() =>
        _i554.ProductRepositoryImpl(
            remoteDataSource: gh<_i881.ProductRemoteDataSource>()));
    gh.lazySingleton<_i841.ProductsUsecase>(
        () => _i841.ProductsUsecase(gh<_i822.ProductsRepository>()));
    gh.factory<_i277.LoginBloc>(
        () => _i277.LoginBloc(gh<_i532.LoginUseCase>()));
    gh.factory<_i975.ProductsBloc>(
        () => _i975.ProductsBloc(gh<_i841.ProductsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
