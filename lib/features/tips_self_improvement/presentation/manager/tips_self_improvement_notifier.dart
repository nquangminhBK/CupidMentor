import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/core_use_cases/generate_ai_content.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/add_tips_self_improvement.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/delete_tips_self_improvement.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/get_tips_self_improvement.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/manager/tips_self_improvement_state.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'tips_self_improvement_notifier.g.dart';

@Riverpod(keepAlive: true)
class TipsSelfImprovementNotifier extends _$TipsSelfImprovementNotifier {
  @override
  TipsSelfImprovementState build() {
    return TipsSelfImprovementState.initial();
  }

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  GetTipsSelfImprovement get getTipsSelfImprovement =>
      ref.read(getTipsSelfImprovementUseCaseProvider);

  AddTipsSelfImprovement get addTipsSelfImprovement =>
      ref.read(addTipsSelfImprovementUseCaseProvider);

  DeleteTipsSelfImprovement get deleteTipsSelfImprovement =>
      ref.read(deleteTipsSelfImprovementUseCaseProvider);

  GenerateAIContent get generateAIContent => ref.read(generateAIContentUseCaseProvider);

  Future<List<ContentResponse>> getTips(ContentWithDescription selfImprovement) async {
    final response = await getTipsSelfImprovement(
      GetTipsSelfImprovementParam(selfImprovementId: selfImprovement.id),
    );
    final data = response.getOrElse(() => []);
    final currentContent = Map<String, List<ContentResponse>>.from(state.content);
    currentContent[selfImprovement.id] = data;
    state = state.copyWith(content: currentContent, errorOrSuccess: null);
    return data;
  }

  Future<bool> deleteTips(String selfImprovementId, String contentId) async {
    var result = false;
    final response = await deleteTipsSelfImprovement(
      DeleteTipsSelfImprovementParam(selfImprovementId: selfImprovementId, contentId: contentId),
    );
    response.fold((error) {
      state = state.copyWith(errorOrSuccess: Left(CannotDeleteTips()));
    }, (deleteResult) {
      if (deleteResult) {
        result = true;
        final currentContentsOfOccasion = state.content[selfImprovementId] ?? [];
        currentContentsOfOccasion.removeWhere((e) => e.id == contentId);
        final currentContents = Map<String, List<ContentResponse>>.from(state.content);
        currentContents[selfImprovementId] = currentContentsOfOccasion;
        state = state.copyWith(content: currentContents, errorOrSuccess: null);
        return result;
      } else {
        state = state.copyWith(errorOrSuccess: Left(CannotDeleteTips()));
      }
    });
    return result;
  }

  Future<ContentResponse?> generateAiContent(
    ContentWithDescription selfImprovement,
    BuildContext context,
  ) async {
    final userInfo = (await getUserInfo(NoParams())).getOrElse(() => null);
    if (userInfo != null && context.mounted) {
      final aiContent = AIContext(
        userInfo: userInfo,
        context: context,
        preloadData: ref.preloadData,
      ).tipsSelfImprovement(selfImprovement);
      debugPrint(aiContent);
      final aiMDText =
          (await generateAIContent(GenerateAIContentParam(contents: [Content.text(aiContent)])))
              .getOrElse(() => '');
      debugPrint(aiMDText);
      if (aiMDText.isNotEmpty) {
        final id = const Uuid().v4();
        final newContent = ContentResponse(content: aiMDText, createdDate: DateTime.now(), id: id);
        final currentContentsOfOccasion = state.content[selfImprovement.id] ?? [];
        currentContentsOfOccasion.add(newContent);
        final currentContents = Map<String, List<ContentResponse>>.from(state.content);
        currentContents[selfImprovement.id] = currentContentsOfOccasion;
        state = state.copyWith(content: currentContents, errorOrSuccess: null);
        await addTipsSelfImprovement(
          AddTipsSelfImprovementParam(selfImprovementId: selfImprovement.id, content: newContent),
        );
        return newContent;
      } else {
        state = state.copyWith(errorOrSuccess: Left(AIGeneratedFailedError()));
      }
    }
    return null;
  }
}
