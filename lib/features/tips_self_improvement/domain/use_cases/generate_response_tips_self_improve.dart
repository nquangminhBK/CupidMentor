import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/repository/tips_self_improve_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final generateResponseTipsSelfImproveUseCaseProvider =
    Provider<GenerateResponseTipsSelfImprove>((ref) {
  return GetIt.I<GenerateResponseTipsSelfImprove>();
});

class GenerateResponseTipsSelfImprove
    implements UseCase<String, GenerateResponseTipsSelfImproveParam> {
  final TipsSelfImproveRepository repository;

  const GenerateResponseTipsSelfImprove({required this.repository});

  @override
  Future<Either<Failure, String>> call(GenerateResponseTipsSelfImproveParam params) async {
    return repository.generateResponseTipsSelfImprove(
        content: params.content, userInfo: params.userInfo,);
  }
}

class GenerateResponseTipsSelfImproveParam {
  final LoggedInUserInfo userInfo;
  final String content;

  const GenerateResponseTipsSelfImproveParam({
    required this.content,
    required this.userInfo,
  });
}
