import 'auth.service.dart';
import '../database/realmservice.dart';

class AuthController {
  final RealmService realmService;
  late AuthService authService;

  AuthController(this.realmService) {
    authService = AuthService(realmService.realm);
  }

  Future<bool> signIn(String email, String password) async {
    return await authService.signIn(email, password);
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