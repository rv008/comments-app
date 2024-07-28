import 'package:comments_app/features/authentication/domain/auth_repository.dart';

class SignupUseCase {
  final AuthRepository _repository;

  SignupUseCase(this._repository);

  Future<bool> call(
    String name,
    String email,
    String password,
  ) =>
      _repository.signup(name, email, password);
}
