sealed class SignInEvent {
  const SignInEvent();
}

final class SignInEmailChanged extends SignInEvent {
  const SignInEmailChanged(this.value);

  final String value;
}

final class SignInPasswordChanged extends SignInEvent {
  const SignInPasswordChanged(this.value);

  final String value;
}

final class SignInRememberMeToggled extends SignInEvent {
  const SignInRememberMeToggled();
}

final class SignInPasswordVisibilityToggled extends SignInEvent {
  const SignInPasswordVisibilityToggled();
}

final class SignInSubmitted extends SignInEvent {
  const SignInSubmitted();
}

final class SignInFeedbackCleared extends SignInEvent {
  const SignInFeedbackCleared();
}
