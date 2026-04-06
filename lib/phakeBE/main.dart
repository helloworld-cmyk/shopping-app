import 'database/realmservice.dart';
import 'auth/auth.controller.dart';
import 'auth/auth_repository.dart';

class PhakeBE {
  static final PhakeBE _instance = PhakeBE._internal();

  late final RealmService _realmService;
  late final AuthRepository auth; // [SOLID - DIP] Sử dụng abstract property

  factory PhakeBE() {
    return _instance;
  }

  PhakeBE._internal() {
    _realmService = RealmService();
    auth = AuthController(_realmService);
  }

  void dispose() {
    _realmService.dispose();
  }


  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  }) {
    return auth.signInWithResult(email: email, password: password);
  }



  static PhakeBE get instance => _instance;

  Future<AuthSignUpResult> signUpWithResult({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) {
    return auth.signUpWithResult(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }
}
