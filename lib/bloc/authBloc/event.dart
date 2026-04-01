sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSignedIn extends AuthEvent {
  const AuthSignedIn();
}

final class AuthSignedOut extends AuthEvent {
  const AuthSignedOut();
}
