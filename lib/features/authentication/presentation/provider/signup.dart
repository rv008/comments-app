import 'package:comments_app/features/authentication/presentation/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup.g.dart';

@riverpod
class SignupNotifier extends _$SignupNotifier {
  @override
  FutureOr<bool?> build() => null;

  Future<void> signup(name, email, password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref.read(signupUseCaseProvider)(name, email, password);
    });
  }
}
