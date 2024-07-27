import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final saveUserInfoUserUseCaseProvider = Provider<SaveUserInfo>((ref) {
  return GetIt.I<SaveUserInfo>();
});

class SaveUserInfo implements UseCase<bool, SaveUserInfoParam> {
  final OnboardingRepository repository;

  const SaveUserInfo({required this.repository});

  @override
  Future<Either<Failure, bool>> call(SaveUserInfoParam params) async {
    return repository.saveUserInfo(params.userInfo);
  }
}

class SaveUserInfoParam {
  SaveUserInfoParam({
    required this.userInfo,
  });

  final LoggedInUserInfo userInfo;
}
