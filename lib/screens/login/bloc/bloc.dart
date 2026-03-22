import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../phakeBE/main.dart';
import 'event.dart';
import 'state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({PhakeBE? phakeBE})
    : _phakeBE = phakeBE ?? PhakeBE.instance,
      super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInRememberMeToggled>(_onRememberMeToggled);
    on<SignInPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<SignInSubmitted>(_onSubmitted);
    on<SignInFeedbackCleared>(_onFeedbackCleared);
  }

  final PhakeBE _phakeBE;

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    emit(
      state.copyWith(
        email: event.value,
        status: SignInSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailureReason: true,
      ),
    );
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.value,
        status: SignInSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailureReason: true,
      ),
    );
  }

  void _onRememberMeToggled(
    SignInRememberMeToggled event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(isRememberMe: !state.isRememberMe));
  }

  void _onPasswordVisibilityToggled(
    SignInPasswordVisibilityToggled event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    final validatedState = state.copyWith(
      showValidationErrors: true,
      status: SignInSubmissionStatus.validating,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    );
    emit(validatedState);

    if (!validatedState.canSubmit) {
      emit(
        validatedState.copyWith(
          status: SignInSubmissionStatus.failure,
          feedbackMessage:
              validatedState.validationMessage ?? 'Please check your input',
        ),
      );
      return;
    }

    emit(
      validatedState.copyWith(
        status: SignInSubmissionStatus.submitting,
        clearFeedbackMessage: true,
        clearFailureReason: true,
      ),
    );

    try {
      final response = await _phakeBE.signInWithResult(
        email: validatedState.normalizedEmail,
        password: validatedState.password,
      );

      emit(
        validatedState.copyWith(
          status: response.isSuccess
              ? SignInSubmissionStatus.success
              : SignInSubmissionStatus.failure,
          feedbackMessage: response.message,
          failureReason: response.isSuccess
              ? null
              : SignInState.mapFailure(response.failure),
          clearFailureReason: response.isSuccess,
        ),
      );
    } catch (_) {
      emit(
        validatedState.copyWith(
          status: SignInSubmissionStatus.failure,
          feedbackMessage: 'Unexpected error, please try again',
          failureReason: SignInFailureReason.unknown,
        ),
      );
    }
  }

  void _onFeedbackCleared(
    SignInFeedbackCleared event,
    Emitter<SignInState> emit,
  ) {
    emit(
      state.copyWith(
        status: SignInSubmissionStatus.idle,
        clearFeedbackMessage: true,
        clearFailureReason: true,
      ),
    );
  }
}
