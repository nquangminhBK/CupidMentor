import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_replying/domain/repository/tip_replying_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';

final deleteConversationUseCaseProvider = Provider<DeleteConversation>((ref) {
  return GetIt.I<DeleteConversation>();
});

class DeleteConversation implements UseCase<bool, NoParams> {
  final TipsReplyingRepository repository;

  const DeleteConversation({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.deleteConversation();
  }
}
