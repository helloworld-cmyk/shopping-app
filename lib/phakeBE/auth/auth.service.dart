import 'package:bcrypt/bcrypt.dart';
import 'package:realm/realm.dart';

import '../database/user/user.dart';

enum AuthSignInFailure { userNotFound, invalidPassword, unknown }

class AuthSignInResult {
  const AuthSignInResult._({
    required this.isSuccess,
    required this.message,
    this.failure,
  });

  const AuthSignInResult.success([String message = 'Sign in successfully'])
    : this._(isSuccess: true, message: message);

  const AuthSignInResult.failure({
    required AuthSignInFailure type,
    required String message,
  }) : this._(isSuccess: false, message: message, failure: type);

  final bool isSuccess;
  final String message;
  final AuthSignInFailure? failure;
}

class AuthService {
  final Realm realm;
  AuthService(this.realm);

  Future<bool> signIn(String email, String password) async {
    final result = await signInWithResult(email: email, password: password);
    return result.isSuccess;
  }

  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final normalizedEmail = email.trim().toLowerCase();
    final users = realm.query<User>(r'email == $0', [normalizedEmail]);

    if (users.isEmpty) {
      return const AuthSignInResult.failure(
        type: AuthSignInFailure.userNotFound,
        message: 'Account not found for this email',
      );
    }

    final user = users.first;

    if (!BCrypt.checkpw(password, user.passwordHash)) {
      return const AuthSignInResult.failure(
        type: AuthSignInFailure.invalidPassword,
        message: 'Email or password is incorrect',
      );
    }

    return AuthSignInResult.success('Welcome back, ${user.firstName}');
  }

  Future<bool> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final normalizedEmail = email.trim().toLowerCase();
    final existingUsers = realm.query<User>(r'email == $0', [normalizedEmail]);
    if (existingUsers.isNotEmpty) {
      return false;
    }

    final newUser = User(
      ObjectId().toString(),
      normalizedEmail,
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
