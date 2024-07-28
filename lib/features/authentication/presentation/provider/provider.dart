import 'package:comments_app/features/authentication/data/auth_repository_impl.dart';
import 'package:comments_app/features/authentication/domain/auth_repository.dart';
import 'package:comments_app/features/authentication/domain/usecase/login.dart';
import 'package:comments_app/features/authentication/domain/usecase/signup.dart';
import 'package:comments_app/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
AuthRepository authRespository(AuthRespositoryRef ref) {
  return AuthRepositoryImpl(
    authService: ref.read(firebaseAuthServiceProvider),
    storageService: ref.read(firestoreServiceProvider),
  );
}

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.read(authRespositoryProvider));
}

@riverpod
SignupUseCase signupUseCase(SignupUseCaseRef ref) {
  return SignupUseCase(ref.read(authRespositoryProvider));
}
