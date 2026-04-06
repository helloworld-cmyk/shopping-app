import 'auth.service.dart' show AuthSignInResult, AuthSignUpResult;

// [SOLID - DIP] Định nghĩa abstraction (interface) AuthRepository. 
// BLoC sẽ phụ thuộc vào interface này thay vì implementation chi tiết.
abstract class AuthRepository {
  Future<AuthSignInResult> signInWithResult({
    required String email,
    required String password,
  });

  Future<AuthSignUpResult> signUpWithResult({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  });


}
