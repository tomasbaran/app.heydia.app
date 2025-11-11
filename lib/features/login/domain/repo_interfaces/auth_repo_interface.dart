import 'package:dia_app/core/utils/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepoInterface {
  Future<Result<User?>> loginWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result> deleteCurrentUser();
  Future<void> logout();
}
