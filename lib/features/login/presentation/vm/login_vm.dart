import 'dart:async';

import 'package:dia_app/core/app_strings.dart';
import 'package:dia_app/core/utils/command.dart';
import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  final AuthRepoInterface _authRepo;
  User? _currentUser;
  StreamSubscription<User?>? _authStateSubscription;

  LoginVM(AuthRepoInterface authRepo) : _authRepo = authRepo {
    // Listen to auth state changes through the repository abstraction
    // authStateChanges() emits the current user state immediately on subscription
    _authStateSubscription = _authRepo.authStateChanges().listen((User? user) {
      _currentUser = user;
      notifyListeners();
    });
  }

  Command<User?, (String, String)> get loginCommand => _loginCommand;
  late final _loginCommand = Command<User?, (String, String)>(
    execute: (args) async =>
        _authRepo.loginWithEmailAndPassword(args.$1, args.$2),
  );

  String get userEmail => _currentUser?.email ?? AppStrings.unknownUser;

  User? get currentUser => _currentUser;

  // Future<Result<void>> login(String email, String password) async {
  //   return await _authRepo.loginWithEmailAndPassword(email, password);
  // }

  Future<void> logout() async {
    await _authRepo.logout();
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    _loginCommand.dispose();
    super.dispose();
  }
}
