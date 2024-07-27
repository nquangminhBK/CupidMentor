import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class NoConnection extends Failure {
  const NoConnection() : super('No connection!');
}

class NotFoundExpectation extends Failure {
  const NotFoundExpectation() : super('No found expected data!');
}

//TODO :refactor this file, remove unuse code
