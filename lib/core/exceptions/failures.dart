abstract class Failure {
  Failure([this.message = 'Error occurred']);
  final String message;
}

// Failure for network errors
class NetworkFailure implements Failure {
  NetworkFailure(this.message);
  @override
  final String message;
}

// Failure for cache errors
class CacheFailure implements Failure {
  CacheFailure(this.message);
  @override
  final String message;
}
