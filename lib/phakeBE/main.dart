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

  Future<bool> signIn(String email, String password) {
    return auth.signIn(email, password);
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
}
