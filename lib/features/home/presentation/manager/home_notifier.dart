import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/home/domain/use_cases/need_show_introduction.dart';
import 'package:cupid_mentor/features/home/presentation/manager/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return const HomeState.initialized();
  }

  CheckNeedShowIntroduction get checkNeedShowIntroduction =>
      ref.read(checkNeedShowIntroductionUseCaseProvider);

  Future<void> checkNeedShowIntroductionPopup() async {
    await Future.delayed(const Duration(milliseconds: 1500), () async {
      final result = await checkNeedShowIntroduction(NoParams());
      result.fold((failed) {}, (success) {
        if (success) {
          state = const HomeState.showIntroductionPopup();
        }
      });
    });
  }
}
