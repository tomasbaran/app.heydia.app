import 'package:dia_app/core/errors_strings.dart';
import 'package:dia_app/core/utils/result.dart';
import 'package:dia_app/features/login/domain/repo_interfaces/auth_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepoInterface {
  final FirebaseAuth _authService;

  AuthRepoImpl(this._authService);

  @override
  Future<Result> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.ok(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Result.error(ErrorsStrings.failedToLogin + e.toString());
    }
  }

  @override
  Future<void> logout() async {
    // TODO: Implement logout
  }

  @override
  Future<Result> deleteCurrentUser() async {
    try {
      await _authService.currentUser?.delete();
      return Result.ok(true);
    } catch (e) {
      return Result.error(ErrorsStrings.failedToDeleteUser + e.toString());
    }
  }
}
