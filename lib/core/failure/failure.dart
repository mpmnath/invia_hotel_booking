abstract class Failure {}

class ServerFailure extends Failure {
  final String message;
  final int? code;

  ServerFailure(this.message, {this.code});
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure(this.message);
}

class StreamFailure extends Failure {
  final String message;

  StreamFailure(this.message);
}
