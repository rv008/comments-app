import 'package:comments_app/features/splash/presentation/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_stream.g.dart';

@riverpod
Stream<bool> authStream(AuthStreamRef ref) {
  return ref.read(streamAuthStateProvider)();
}
