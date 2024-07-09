import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/generate_response_tips_self_improve.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tips_self_improve_notifier.g.dart';

@riverpod
class TipsSelfImproveNotifier extends _$TipsSelfImproveNotifier {
  @override
  int build() {
    return -1;
  }

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  GenerateResponseTipsSelfImprove get generateResponseTipsSelfImprove =>
      ref.read(generateResponseTipsSelfImproveUseCaseProvider);

  Future<String> getData(String content, BuildContext buildContext) async {
    final userResponse = await getUserInfo(NoParams());
    final userInfo = userResponse.getOrElse(() => null);
    final currentLang = ref.read(localizationNotifierProvider).lang;
    var context = "";
    // if (userInfo != null) {
    //   final context = AIContext(userInfo: userInfo, context: buildContext).generateAIContext;
    //   print("minh check $context \"$content\"");
    // }

    return "";
    // final contentResponse = await generateResponseTipsSelfImprove(
    //   GenerateResponseTipsSelfImproveParam(content: content, userInfo: userInfo!),
    // );
    // return contentResponse.getOrElse(() => '');
  }
}
