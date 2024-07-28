import 'package:comments_app/features/authentication/domain/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<bool> call(String email, String password) =>
      _repository.login(email, password);
}
