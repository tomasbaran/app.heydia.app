abstract class AuthRepoInterface {
  Future<void> login(String email, String password);
  Future<void> logout();
}
