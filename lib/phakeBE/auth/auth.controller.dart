export 'auth.service.dart' show AuthSignInResult, AuthSignUpResult;

import 'auth.service.dart';
import '../database/realmservice.dart';

class AuthController {
  final RealmService realmService;
  late AuthService authService;

  AuthController(this.realmService) {
    authService = AuthService(realmService.realm);
  }

  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  }) async {
    return authService.signInWithResult(email: email, password: password);
  }

  Future<bool> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
  ) async {
    return await authService.signUp(
      email,
      password,
      firstName,
      lastName,
      phoneNumber,
    );
  }

  Future<AuthSignUpResult> signUpWithResult({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    return authService.signUpWithResult(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }
}
