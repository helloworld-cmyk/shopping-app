import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../phakeBE/main.dart';
import 'event.dart';
import 'state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({PhakeBE? phakeBE})
    : _phakeBE = phakeBE ?? PhakeBE.instance,
      super(const SignUpState()) {
    on<SignUpFirstNameChanged>(_onFirstNameChanged);
    on<SignUpLastNameChanged>(_onLastNameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPhoneNumberChanged>(_onPhoneNumberChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<SignUpConfirmPasswordVisibilityToggled>(_onConfirmPasswordVisibilityToggled);
    on<SignUpSubmitted>(_onSubmitted);
    on<SignUpFeedbackCleared>(_onFeedbackCleared);
  }

  final PhakeBE _phakeBE;

  void _onFirstNameChanged(SignUpFirstNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      firstName: event.value,
      status: SignUpSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));
  }

  void _onLastNameChanged(SignUpLastNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      lastName: event.value,
      status: SignUpSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));
  }

  void _onEmailChanged(SignUpEmailChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      email: event.value,
      status: SignUpSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));
  }

  void _onPhoneNumberChanged(SignUpPhoneNumberChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      phoneNumber: event.value,
      status: SignUpSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));
  }

  void _onPasswordChanged(SignUpPasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      password: event.value,
      status: SignUpSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));
  }

  void _onConfirmPasswordChanged(SignUpConfirmPasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      confirmPassword: event.value,
      status: SignUpSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));
  }

  void _onPasswordVisibilityToggled(SignUpPasswordVisibilityToggled event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  void _onConfirmPasswordVisibilityToggled(SignUpConfirmPasswordVisibilityToggled event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isConfirmPasswordObscured: !state.isConfirmPasswordObscured));
  }

  Future<void> _onSubmitted(SignUpSubmitted event, Emitter<SignUpState> emit) async {
    final validatedState = state.copyWith(
      showValidationErrors: true,
      status: SignUpSubmissionStatus.validating,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    );
    emit(validatedState);

    if (!validatedState.canSubmit) {
      emit(validatedState.copyWith(
        status: SignUpSubmissionStatus.failure,
        feedbackMessage: validatedState.validationMessage ?? 'Please check your input',
      ));
      return;
    }

    emit(validatedState.copyWith(
      status: SignUpSubmissionStatus.submitting,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));

    try {
      final response = await _phakeBE.signUpWithResult(
        email: validatedState.normalizedEmail,
        password: validatedState.password,
        firstName: validatedState.firstName,
        lastName: validatedState.lastName,
        phoneNumber: validatedState.normalizedPhoneNumber,
      );

      emit(validatedState.copyWith(
        status: response.isSuccess ? SignUpSubmissionStatus.success : SignUpSubmissionStatus.failure,
        feedbackMessage: response.message,
        failureReason: response.isSuccess ? null : SignUpState.mapFailure(response.failure),
        clearFailureReason: response.isSuccess,
      ));
    } catch (_) {
      emit(validatedState.copyWith(
        status: SignUpSubmissionStatus.failure,
        feedbackMessage: 'Unexpected error, please try again',
        failureReason: SignUpFailureReason.unknown,
      ));
    }
  }

  void _onFeedbackCleared(SignUpFeedbackCleared event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      status: SignUpSubmissionStatus.idle,
      clearFeedbackMessage: true,
      clearFailureReason: true,
    ));
  }
}
