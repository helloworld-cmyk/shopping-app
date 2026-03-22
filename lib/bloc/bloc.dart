import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthSignedIn>(_onSignedIn);
    on<AuthSignedOut>(_onSignedOut);
  }

  void _onSignedIn(AuthSignedIn event, Emitter<AuthState> emit) {
    emit(state.copyWith(isAuth: true));
  }

  void _onSignedOut(AuthSignedOut event, Emitter<AuthState> emit) {
    emit(state.copyWith(isAuth: false));
  }
}
