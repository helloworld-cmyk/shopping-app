import 'database/realmservice.dart';
import 'auth/auth.controller.dart';

class PhakeBE {
  static final PhakeBE _instance = PhakeBE._internal();

  late final RealmService _realmService;
  late final AuthController auth;

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

  Future<bool> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
  ) {
    return auth.signUp(email, password, firstName, lastName, phoneNumber);
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
