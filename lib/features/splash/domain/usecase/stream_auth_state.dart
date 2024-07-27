import 'package:comments_app/features/splash/domain/splash_repository.dart';

class StreamAuthState {
  final SplashRepository _repo;

  StreamAuthState(this._repo);

  Stream<bool> call() => _repo.authState();
}
