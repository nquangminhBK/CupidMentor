import 'package:cupid_mentor/features/auth/presentation/manager/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_notifier.g.dart';
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState.initialized();
  }
}