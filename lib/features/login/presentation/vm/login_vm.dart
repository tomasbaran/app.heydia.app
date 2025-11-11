import 'package:dia_app/core/utils/command.dart';
import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  final AuthRepoInterface _authRepo;
  LoginVM(AuthRepoInterface authRepo) : _authRepo = authRepo;

  Command<User?, (String, String)> get loginCommand => _loginCommand;
  late final _loginCommand = Command<User?, (String, String)>(
    execute: (args) async =>
        _authRepo.loginWithEmailAndPassword(args.$1, args.$2),
  );

  // Future<Result<void>> login(String email, String password) async {
  //   return await _authRepo.loginWithEmailAndPassword(email, password);
  // }

  Future<void> logout() async {
    await _authRepo.logout();
  }
}
