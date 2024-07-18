import 'package:cupid_mentor/core/constants/self_improvement.dart';
import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/core_use_cases/generate_ai_content.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/add_tips_self_improvement.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/get_tips_self_improvement.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/manager/tips_self_improvement_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  GenerateAIContent get generateAIContent => ref.read(generateAIContentUseCaseProvider);

  Future<List<ContentResponse>> getTips(SelfImprovement selfImprovement) async {
    final response = await getTipsSelfImprovement(
      GetTipsSelfImprovementParam(selfImprovementId: selfImprovement.id),
    );
    final data = response.getOrElse(() => []);
    final currentContent = Map<String, List<ContentResponse>>.from(state.content);
    currentContent[selfImprovement.id] = data;
    state = state.copyWith(content: currentContent, error: null);
    return data;
  }

  Future<ContentResponse?> generateAiContent(
    SelfImprovement selfImprovement,
    BuildContext context,
  ) async {
    final userInfo = (await getUserInfo(NoParams())).getOrElse(() => null);
    if (userInfo != null && context.mounted) {
      final aiContent =
          AIContext(userInfo: userInfo, context: context).tipsSelfImprovement(selfImprovement);
      debugPrint(aiContent);
      final aiMDText =
          (await generateAIContent(GenerateAIContentParam(contents: [Content.text(aiContent)])))
              .getOrElse(() => '');
      if (aiMDText.isNotEmpty) {
        final newContent = ContentResponse(content: aiMDText, createdDate: DateTime.now());
        final currentContentsOfOccasion = state.content[selfImprovement.id] ?? [];
        currentContentsOfOccasion.add(newContent);
        final currentContents = Map<String, List<ContentResponse>>.from(state.content);
        currentContents[selfImprovement.id] = currentContentsOfOccasion;
        state = state.copyWith(content: currentContents, error: null);
        await addTipsSelfImprovement(
          AddTipsSelfImprovementParam(selfImprovementId: selfImprovement.id, content: newContent),
        );
        return newContent;
      } else {
        if (context.mounted) {
          state = state.copyWith(error: context.l10n.generateFailed);
        }
      }
    }
    return null;
  }
}
