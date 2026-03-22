class AuthState {
  const AuthState({this.isAuth = false});

  final bool isAuth;

  AuthState copyWith({bool? isAuth}) {
    return AuthState(isAuth: isAuth ?? this.isAuth);
  }
}
