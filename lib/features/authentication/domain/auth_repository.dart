abstract class AuthRepository {
  Future<bool> login(String email, password);
  Future<bool> signup(String name, String email, String password);
}
