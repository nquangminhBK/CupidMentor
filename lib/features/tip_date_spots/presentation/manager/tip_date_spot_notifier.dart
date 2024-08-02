import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/core_use_cases/generate_ai_content.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/use_cases/add_tips_date_spot.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/use_cases/get_tips_date_spot.dart';
import 'package:cupid_mentor/features/tip_date_spots/presentation/manager/tip_date_spot_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tip_date_spot_notifier.g.dart';

@Riverpod(keepAlive: true)
class TipsDateSpotNotifier extends _$TipsDateSpotNotifier {
  @override
  TipsDateSpotState build() {
    return TipsDateSpotState.initial();
  }

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  GetTipsDateSpot get getTipsDateSpot => ref.read(getTipsDateSpotUseCaseProvider);

  AddTipsDateSpot get addTipsDateSpot => ref.read(addTipsDateSpotUseCaseProvider);

  GenerateAIContent get generateAIContent => ref.read(generateAIContentUseCaseProvider);

  Future<List<ContentResponse>> getTipsDateSpotByOccasion(ContentWithImage occasion) async {
    final response =
        await getTipsDateSpot(GetTipsDateSpotParam(occasionId: occasion.title.id ?? ''));
    final data = response.getOrElse(() => []);
    final currentContent = Map<String, List<ContentResponse>>.from(state.content);
    currentContent[occasion.title.id ?? ''] = data;
    state = state.copyWith(content: currentContent, errorOrSuccess: null);
    return data;
  }

  Future<ContentResponse?> generateAiContent(
    ContentWithImage occasion,
    BuildContext context,
  ) async {
    final userInfo = (await getUserInfo(NoParams())).getOrElse(() => null);
    if (userInfo != null && context.mounted) {
      final aiContent = AIContext(
        userInfo: userInfo,
        context: context,
        preloadData: ref.preloadData,
      ).tipsDateSpotCommand(occasion);
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
        await addTipsDateSpot(
          AddTipsDateSpotParam(occasionId: occasion.title.id ?? '', content: newContent),
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
