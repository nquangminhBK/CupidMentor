import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/showcase/presentation/manager/showcase_state.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/update_show_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'showcase_notifier.g.dart';

@riverpod
class ShowcaseNotifier extends _$ShowcaseNotifier {
  UpdateShowCase get updateShowCase => ref.read(updateShowCaseUseCaseProvider);

  @override
  ShowCaseState build() {
    return const ShowCaseState.initialized();
  }

  void nextPage(int currentPage) {
    switch (currentPage) {
      case 0:
        state = const ShowCaseState.goToStep2();
      case 1:
        state = const ShowCaseState.goToStep3();
    }
  }

  void backPage(int currentPage) {
    switch (currentPage) {
      case 2:
        state = const ShowCaseState.goToStep2();
      case 1:
        state = const ShowCaseState.goToStep1();
    }
  }

  Future<void> updateShowCaseFinish() async {
    await updateShowCase(NoParams());
  }
}
