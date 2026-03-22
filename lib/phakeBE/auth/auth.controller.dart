export 'auth.service.dart' show AuthSignInResult;

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
}
