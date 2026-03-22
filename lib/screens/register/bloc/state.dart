import '../../../phakeBE/auth/auth.service.dart';

enum SignUpSubmissionStatus { idle, validating, submitting, success, failure }

enum SignUpFailureReason { emailAlreadyInUse, unknown }

class SignUpState {
  const SignUpState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isPasswordObscured = true,
    this.isConfirmPasswordObscured = true,
    this.showValidationErrors = false,
    this.status = SignUpSubmissionStatus.idle,
    this.feedbackMessage,
    this.failureReason,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final bool isPasswordObscured;
  final bool isConfirmPasswordObscured;
  final bool showValidationErrors;
  final SignUpSubmissionStatus status;
  final String? feedbackMessage;
  final SignUpFailureReason? failureReason;

  bool get isSubmitting => status == SignUpSubmissionStatus.submitting;
  bool get isSuccess => status == SignUpSubmissionStatus.success;
  bool get isFailure => status == SignUpSubmissionStatus.failure;

  String get normalizedEmail => email.trim().toLowerCase();
  String get normalizedPhoneNumber => phoneNumber.trim();

  // validation checks
  bool get isFirstNameEmpty => firstName.trim().isEmpty;
  bool get isLastNameEmpty => lastName.trim().isEmpty;
  bool get isEmailEmpty => normalizedEmail.isEmpty;
  bool get isPhoneNumberEmpty => normalizedPhoneNumber.isEmpty;
  bool get isPasswordEmpty => password.isEmpty;
  bool get isConfirmPasswordEmpty => confirmPassword.isEmpty;

  bool get isEmailValid {
    if (isEmailEmpty) return false;
    final emailRegex = RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$");
    return emailRegex.hasMatch(normalizedEmail);
  }

  bool get isPasswordValid {
    return password.length >= 6; 
  }

  bool get doPasswordsMatch => password == confirmPassword;

  bool get canSubmit =>
      !isFirstNameEmpty &&
      !isLastNameEmpty &&
      isEmailValid &&
      !isPhoneNumberEmpty &&
      isPasswordValid &&
      doPasswordsMatch &&
      !isSubmitting;

  String? get firstNameError => (showValidationErrors && isFirstNameEmpty) ? 'Please enter first name' : null;
  String? get lastNameError => (showValidationErrors && isLastNameEmpty) ? 'Please enter last name' : null;
  
  String? get emailError {
    if (!showValidationErrors) return null;
    if (isEmailEmpty) return 'Please enter email';
    if (!isEmailValid) return 'Invalid email format';
    if (failureReason == SignUpFailureReason.emailAlreadyInUse) return 'Email already in use';
    return null;
  }

  String? get phoneNumberError => (showValidationErrors && isPhoneNumberEmpty) ? 'Please enter phone number' : null;

  String? get passwordError {
    if (!showValidationErrors) return null;
    if (isPasswordEmpty) return 'Please enter password';
    if (!isPasswordValid) return 'Password must be at least 6 characters';
    return null;
  }

  String? get confirmPasswordError {
    if (!showValidationErrors) return null;
    if (isConfirmPasswordEmpty) return 'Please confirm password';
    if (!doPasswordsMatch) return 'Passwords do not match';
    return null;
  }

  String? get validationMessage {
    if (isFirstNameEmpty) return 'Please enter your first name';
    if (isLastNameEmpty) return 'Please enter your last name';
    if (isEmailEmpty) return 'Please enter your email';
    if (!isEmailValid) return 'Please enter a valid email';
    if (isPhoneNumberEmpty) return 'Please enter your phone number';
    if (isPasswordEmpty) return 'Please enter your password';
    if (!isPasswordValid) return 'Password must be at least 6 characters';
    if (isConfirmPasswordEmpty) return 'Please confirm your password';
    if (!doPasswordsMatch) return 'Passwords do not match';
    return null;
  }

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
    bool? showValidationErrors,
    SignUpSubmissionStatus? status,
    String? feedbackMessage,
    SignUpFailureReason? failureReason,
    bool clearFeedbackMessage = false,
    bool clearFailureReason = false,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isConfirmPasswordObscured: isConfirmPasswordObscured ?? this.isConfirmPasswordObscured,
      showValidationErrors: showValidationErrors ?? this.showValidationErrors,
      status: status ?? this.status,
      feedbackMessage: clearFeedbackMessage ? null : feedbackMessage ?? this.feedbackMessage,
      failureReason: clearFailureReason ? null : failureReason ?? this.failureReason,
    );
  }

  static SignUpFailureReason mapFailure(AuthSignUpFailure? failure) {
    switch (failure) {
      case AuthSignUpFailure.emailAlreadyInUse:
        return SignUpFailureReason.emailAlreadyInUse;
      case AuthSignUpFailure.unknown:
      case null:
        return SignUpFailureReason.unknown;
    }
  }
}
