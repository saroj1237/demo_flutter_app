abstract class Failure {}

// Failure for network errors
class NetworkFailure implements Failure {
  NetworkFailure(this.message);
  final String message;
}

// Failure for cache errors
class CacheFailure implements Failure {
  CacheFailure(this.message);
  final String message;
}
