import 'package:comments_app/features/comments/presentation/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_mask.g.dart';

@riverpod
FutureOr<void> initEmailMask(InitEmailMaskRef ref) {
  return ref.watch(initializeEmailMaskUseCaseProvider)();
}

@riverpod
Stream<bool> canMaskEmail(CanMaskEmailRef ref) async* {
  await ref.watch(initEmailMaskProvider.future);
  yield* ref.watch(canMaskEmailUseCaseProvider)();
}

@riverpod
Future<String> maskedEmail(MaskedEmailRef ref, String email) async {
  var canMask = await ref.watch(canMaskEmailProvider.future);
  if (canMask && email.isNotEmpty) {
    return email.replaceFirstMapped(
        RegExp(r'^(.{3}).*@'), (m) => '${m[1]}****@');
  }
  return email;
}
