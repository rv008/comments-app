import 'package:comments_app/features/splash/data/splash_repository_impl.dart';
import 'package:comments_app/features/splash/domain/splash_repository.dart';
import 'package:comments_app/features/splash/domain/usecase/stream_auth_state.dart';
import 'package:comments_app/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
SplashRepository splashRepository(SplashRepositoryRef ref) {
  return SplashRepositoryImpl(ref.read(firebaseAuthServiceProvider));
}

@riverpod
StreamAuthState streamAuthState(StreamAuthStateRef ref) {
  return StreamAuthState(ref.read(splashRepositoryProvider));
}
