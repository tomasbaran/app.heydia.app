import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';

class LoginVM {
  final AuthRepoInterface authRepo;

  LoginVM(this.authRepo);

  Future<void> login(String email, String password) async {
    await authRepo.login(email, password);
  }

  Future<void> logout() async {
    await authRepo.logout();
  }
}
