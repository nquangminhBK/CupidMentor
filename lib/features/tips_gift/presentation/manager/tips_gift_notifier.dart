import 'package:cupid_mentor/core/constants/special_occasion.dart';
import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/core_use_cases/generate_ai_content.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/tips_gift/domain/use_cases/add_tips_gift.dart';
import 'package:cupid_mentor/features/tips_gift/domain/use_cases/get_tips_gift.dart';
import 'package:cupid_mentor/features/tips_gift/presentation/manager/tips_gift_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tips_gift_notifier.g.dart';

@Riverpod(keepAlive: true)
class TipsGiftNotifier extends _$TipsGiftNotifier {
  @override
  TipsGiftState build() {
    return TipsGiftState.initial();
  }

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  GetTipsGift get getTipsGift => ref.read(getTipsGiftUseCaseProvider);

  AddTipsGift get addTipsGift => ref.read(addTipsGiftUseCaseProvider);

  GenerateAIContent get generateAIContent => ref.read(generateAIContentUseCaseProvider);

  Future<List<ContentResponse>> getTipsGiftByOccasion(SpecialOccasion occasion) async {
    final response = await getTipsGift(GetTipsGiftParam(occasionId: occasion.title.id ?? ''));
    final data = response.getOrElse(() => []);
    final currentContent = Map<String, List<ContentResponse>>.from(state.content);
    currentContent[occasion.title.id ?? ''] = data;
    state = state.copyWith(content: currentContent, errorOrSuccess: null);
    return data;
  }

  Future<ContentResponse?> generateAiContent(SpecialOccasion occasion, BuildContext context) async {
    final userInfo = (await getUserInfo(NoParams())).getOrElse(() => null);
    if (userInfo != null && context.mounted) {
      final aiContent = AIContext(userInfo: userInfo, context: context).tipsGiftCommand(occasion);
      debugPrint(aiContent);
      final aiMDText =
          (await generateAIContent(GenerateAIContentParam(contents: [Content.text(aiContent)])))
              .getOrElse(() => '');
      if (aiMDText.isNotEmpty) {
        final newContent = ContentResponse(content: aiMDText, createdDate: DateTime.now());
        final currentContentsOfOccasion = state.content[occasion.title.id ?? ''] ?? [];
        currentContentsOfOccasion.add(newContent);
        final currentContents = Map<String, List<ContentResponse>>.from(state.content);
        currentContents[occasion.title.id ?? ''] = currentContentsOfOccasion;
        state = state.copyWith(content: currentContents, errorOrSuccess: null);
        await addTipsGift(
          AddTipsGiftParam(occasionId: occasion.title.id ?? '', content: newContent),
        );
        return newContent;
      } else {
        if (context.mounted) {
          state = state.copyWith(errorOrSuccess: Left(AIGeneratedFailedError()));
        }
      }
    }
    return null;
  }
}
