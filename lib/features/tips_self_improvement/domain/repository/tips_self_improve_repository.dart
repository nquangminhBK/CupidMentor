import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';

abstract class TipsSelfImproveRepository {
  Future<Either<Failure, String>> generateResponseTipsSelfImprove({
    required String content,
    required LoggedInUserInfo userInfo,
  });
}
