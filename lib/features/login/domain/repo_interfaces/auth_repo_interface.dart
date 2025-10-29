import 'package:dia_app/core/utils/result.dart';

abstract class AuthRepoInterface {
  Future<Result> loginWithEmailAndPassword(String email, String password);
  Future<Result> deleteCurrentUser();
  Future<void> logout();
}
