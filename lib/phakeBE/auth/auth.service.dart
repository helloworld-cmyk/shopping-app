import 'package:bcrypt/bcrypt.dart';
import 'package:realm/realm.dart';

import '../database/user/user.dart';

class AuthService {
  final Realm realm;
  AuthService(this.realm);

  Future<bool> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    final users = realm.query<User>(r'email == $0', [email]);
    if (users.isNotEmpty &&
        BCrypt.checkpw(password, users.first.passwordHash)) {
      return true;
    }
    return false;
  }

  Future<bool> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final existingUsers = realm.query<User>(r'email == $0', [email]);
    if (existingUsers.isNotEmpty) {
      return false;
    }

    final newUser = User(
      ObjectId().toString(),
      email,
      BCrypt.hashpw(password, BCrypt.gensalt()),
      firstName,
      lastName,
      phoneNumber,
    );

    realm.write(() {
      realm.add(newUser);
    });

    return true;
  }
}
