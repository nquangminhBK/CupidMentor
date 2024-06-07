import 'package:dio/dio.dart';

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

class RequireNewPasswordFailure extends Failure {
  const RequireNewPasswordFailure() : super('Requires new password');
}

class TermAndConditionFetchingFailure extends Failure {
  const TermAndConditionFetchingFailure(super.message);
}

class DioFailure extends Failure {
  const DioFailure(super.message, this.statusCode);

  factory DioFailure.create(DioException error) {
    return DioFailure(error.message ?? '', error.response?.statusCode ?? -1);
  }

  final int statusCode;
}

class NoInProgressChargingFailure extends Failure {
  const NoInProgressChargingFailure()
      : super('No charging session is in progress.');
}
//TODO :refactor this file, remove unuse code