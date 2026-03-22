sealed class SignUpEvent {
  const SignUpEvent();
}

final class SignUpFirstNameChanged extends SignUpEvent {
  const SignUpFirstNameChanged(this.value);
  final String value;
}

final class SignUpLastNameChanged extends SignUpEvent {
  const SignUpLastNameChanged(this.value);
  final String value;
}

final class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.value);
  final String value;
}

final class SignUpPhoneNumberChanged extends SignUpEvent {
  const SignUpPhoneNumberChanged(this.value);
  final String value;
}

final class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.value);
  final String value;
}

final class SignUpConfirmPasswordChanged extends SignUpEvent {
  const SignUpConfirmPasswordChanged(this.value);
  final String value;
}

final class SignUpPasswordVisibilityToggled extends SignUpEvent {
  const SignUpPasswordVisibilityToggled();
}

final class SignUpConfirmPasswordVisibilityToggled extends SignUpEvent {
  const SignUpConfirmPasswordVisibilityToggled();
}

final class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}

final class SignUpFeedbackCleared extends SignUpEvent {
  const SignUpFeedbackCleared();
}
