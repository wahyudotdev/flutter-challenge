abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  late String _message;
  @override
  String get message => _message;

  ServerFailure({String message = 'server failure'}) {
    _message = message;
  }
}

class UnknownFailure extends Failure {
  late String _message;
  @override
  String get message => _message;

  UnknownFailure({String message = 'unknown failure'}) {
    _message = message;
  }
}
