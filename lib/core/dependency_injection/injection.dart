import 'dart:io';

import 'package:demo_flutter_app/core/dependency_injection/injection.config.dart';
import 'package:demo_flutter_app/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  List<Interceptor> get interceptors => [];

  @singleton
  Dio get dio => getDio(FlavorConfig.instance.baseUrl);
}

Dio getDio(String baseUrl) {
  final dio = Dio()..options.baseUrl = baseUrl;
  return dio;
}
