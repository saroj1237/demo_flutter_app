import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest(String reason) =
      UnauthorisedRequest;

  const factory NetworkExceptions.badRequest(String reason) = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout(String reason) =
      RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict(String reason) = Conflict;

  const factory NetworkExceptions.internalServerError(String reason) =
      InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable(String reason) =
      ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkException;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkException = const NetworkExceptions.requestCancelled();
            case DioExceptionType.connectionTimeout:
              networkException =
                  const NetworkExceptions.requestTimeout('Requrest timeout');
            case DioExceptionType.unknown:
              networkException = const NetworkExceptions.unexpectedError();
            case DioExceptionType.receiveTimeout:
              networkException = const NetworkExceptions.sendTimeout();
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  networkException = NetworkExceptions.badRequest(
                    error.response?.data['message'] as String? ??
                        'Error Occured with status 400',
                  );

                case 401:
                  networkException = NetworkExceptions.unauthorisedRequest(
                    error.response?.data['message'] as String? ??
                        'Error Occured with status 401',
                  );
                case 403:
                  networkException =
                      const NetworkExceptions.unauthorisedRequest(
                    'Error Occured with status 403',
                  );
                case 404:
                  networkException = const NetworkExceptions.notFound(
                    'Error Occured with status 404',
                  );
                case 409:
                  networkException = const NetworkExceptions.conflict(
                    'Error Occured with status 409',
                  );
                case 408:
                  networkException = const NetworkExceptions.requestTimeout(
                    'Error Occured with status 408',
                  );
                case 422:
                  networkException = const NetworkExceptions.badRequest(
                    'Error Occured with status 422',
                  );
                case 500:
                  networkException =
                      const NetworkExceptions.internalServerError(
                    'Internal Server Error with status 500',
                  );
                case 503:
                  networkException = const NetworkExceptions.serviceUnavailable(
                    'Internal Server Error with status 503',
                  );
                default:
                  final responseCode = error.response!.statusCode;
                  networkException = NetworkExceptions.defaultError(
                    'Received invalid status code: $responseCode',
                  );
              }
            case DioException.sendTimeout:
              networkException = const NetworkExceptions.sendTimeout();
            case DioExceptionType.badCertificate:
              networkException = const NetworkExceptions.unexpectedError();
            case DioExceptionType.connectionError:
              networkException = const NetworkExceptions.unexpectedError();
            case DioExceptionType.sendTimeout:
              networkException = const NetworkExceptions.sendTimeout();
          }
        } else if (error is SocketException) {
          networkException = const NetworkExceptions.noInternetConnection();
        } else {
          networkException = const NetworkExceptions.unexpectedError();
        }
        return networkException;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      return const NetworkExceptions.unexpectedError();
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = '';
    networkExceptions.when(
      notImplemented: () {
        errorMessage = 'Not Implemented';
      },
      requestCancelled: () {
        errorMessage = 'Request Cancelled';
      },
      internalServerError: (reason) {
        errorMessage = reason;
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: (reason) {
        errorMessage = reason;
      },
      methodNotAllowed: () {
        errorMessage = 'Method Allowed';
      },
      badRequest: (String error) {
        errorMessage = error;
      },
      unauthorisedRequest: (reason) {
        errorMessage = reason;
      },
      unexpectedError: () {
        errorMessage = 'Unexpected error occurred';
      },
      requestTimeout: (reason) {
        errorMessage = reason;
      },
      noInternetConnection: () {
        errorMessage = 'No internet connection';
      },
      conflict: (reason) {
        errorMessage = reason;
      },
      sendTimeout: () {
        errorMessage = 'Send timeout in connection with API server';
      },
      unableToProcess: () {
        errorMessage = 'Unable to process the data';
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = 'Unexpected error occurred';
      },
      notAcceptable: () {
        errorMessage = 'Not acceptable';
      },
    );
    return errorMessage;
  }
}
