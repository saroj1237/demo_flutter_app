// ignore_for_file: comment_references

import 'dart:async';
import 'package:demo_flutter_app/core/dependency_injection/injection.dart';
import 'package:demo_flutter_app/core/network/dio_interceptiors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ApiService {
  ApiService(this.dio, this.prefs) {
    dio.interceptors.addAll([
      getIt<TokenInterceptor>(),
      getIt<ErrorHandlerInterceptor>(),
      // Add other interceptors here
    ]);
    // Add logging interceptor in debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
        ),
      );
    }
    dio.options.connectTimeout = const Duration(seconds: 20);
  }
  SharedPreferences prefs;
  Dio dio;

  /// A method to call [GET] apis
  Future<Response<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.get<Response<dynamic>>(uri,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          options: options,
          queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// A method to call [POST] apis
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post<Response<dynamic>>(uri,
          data: data,
          onSendProgress: onSendProgress,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          options: options,
          queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
