import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Error handler interceptor
@injectable
class ErrorHandlerInterceptor extends Interceptor {
  ErrorHandlerInterceptor(this.prefs);
  SharedPreferences prefs;

  @override
  FutureOr<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Case 401 happens when the token is expired
    if (err.response?.statusCode == 401) {
      // Clear the session(token) and navigate to login page
      // Or
      // Refresh the token and retry the request
    }
    return handler.next(err);
  }
}

// Token interceptor
@injectable
class TokenInterceptor extends Interceptor {
  TokenInterceptor(this.prefs);
  SharedPreferences prefs;

  @override
  FutureOr<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get the token from the session
    // Add the token to the request header
    return handler.next(options);
  }
}

// Make other interceptors here and add them to the ApiService
