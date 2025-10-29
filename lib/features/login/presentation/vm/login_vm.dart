import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';

class LoginVM {
  final AuthRepoInterface _authRepo;

  LoginVM(this._authRepo);

  Future<void> login(String email, String password) async {
    await _authRepo.loginWithEmailAndPassword(email, password);
  }

  Future<void> logout() async {
    await _authRepo.logout();
  }
}
