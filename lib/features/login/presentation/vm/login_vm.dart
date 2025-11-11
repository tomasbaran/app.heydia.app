import 'package:dia_app/core/utils/result.dart';
import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';
import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  final AuthRepoInterface _authRepo;

  LoginVM(this._authRepo);

  Future<Result<void>> login(String email, String password) async {
    return await _authRepo.loginWithEmailAndPassword(email, password);
  }

  Future<void> logout() async {
    await _authRepo.logout();
  }
}
