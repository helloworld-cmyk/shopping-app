import '../../../phakeBE/auth/auth.service.dart';

enum SignInSubmissionStatus { idle, validating, submitting, success, failure }

enum SignInFailureReason { accountNotFound, wrongPassword, unknown }

class SignInState {
  const SignInState({
    this.email = '',
    this.password = '',
    this.isRememberMe = true,
    this.isPasswordObscured = true,
    this.showValidationErrors = false,
    this.status = SignInSubmissionStatus.idle,
    this.feedbackMessage,
    this.failureReason,
  });

  final String email;
  final String password;
  final bool isRememberMe;
  final bool isPasswordObscured;
  final bool showValidationErrors;
  final SignInSubmissionStatus status;
  final String? feedbackMessage;
  final SignInFailureReason? failureReason;

  bool get isSubmitting => status == SignInSubmissionStatus.submitting;
  bool get isSuccess => status == SignInSubmissionStatus.success;
  bool get isFailure => status == SignInSubmissionStatus.failure;

  String get normalizedEmail => email.trim().toLowerCase();

  bool get isEmailEmpty => normalizedEmail.isEmpty;

  bool get isEmailValid {
    if (isEmailEmpty) {
      return false;
    }

    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(normalizedEmail);
  }

  bool get isPasswordEmpty => password.trim().isEmpty;

  bool get canSubmit => isEmailValid && !isPasswordEmpty && !isSubmitting;

  String? get emailError {
    if (!showValidationErrors) {
      return null;
    }

    if (isEmailEmpty) {
      return 'Please enter your email';
    }

    if (!isEmailValid) {
      return 'Invalid email format';
    }

    if (failureReason == SignInFailureReason.accountNotFound) {
      return 'Email does not exist';
    }

    return null;
  }

  String? get passwordError {
    if (!showValidationErrors) {
      return null;
    }

    if (isPasswordEmpty) {
      return 'Please enter your password';
    }

    if (failureReason == SignInFailureReason.wrongPassword) {
      return 'Incorrect password';
    }

    return null;
  }

  String? get validationMessage {
    if (isEmailEmpty) {
      return 'Please enter your email';
    }

    if (!isEmailValid) {
      return 'Please enter a valid email';
    }

    if (isPasswordEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  SignInState copyWith({
    String? email,
    String? password,
    bool? isRememberMe,
    bool? isPasswordObscured,
    bool? showValidationErrors,
    SignInSubmissionStatus? status,
    String? feedbackMessage,
    SignInFailureReason? failureReason,
    bool clearFeedbackMessage = false,
    bool clearFailureReason = false,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      showValidationErrors: showValidationErrors ?? this.showValidationErrors,
      status: status ?? this.status,
      feedbackMessage: clearFeedbackMessage
          ? null
          : feedbackMessage ?? this.feedbackMessage,
      failureReason: clearFailureReason
          ? null
          : failureReason ?? this.failureReason,
    );
  }

  static SignInFailureReason mapFailure(AuthSignInFailure? failure) {
    switch (failure) {
      case AuthSignInFailure.userNotFound:
        return SignInFailureReason.accountNotFound;
      case AuthSignInFailure.invalidPassword:
        return SignInFailureReason.wrongPassword;
      case AuthSignInFailure.unknown:
      case null:
        return SignInFailureReason.unknown;
    }
  }
}
