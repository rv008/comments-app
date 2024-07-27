import 'package:comments_app/features/splash/domain/splash_repository.dart';
import 'package:comments_app/utils/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashRepositoryImpl implements SplashRepository {
  final FirebaseAuthService authService;

  SplashRepositoryImpl(this.authService);

  @override
  Stream<bool> authState() {
    return authService.authStateChanges.map((User? user) => user != null);
  }
}
