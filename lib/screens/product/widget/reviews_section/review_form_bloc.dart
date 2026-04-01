import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'review_form_event.dart';
import 'review_form_state.dart';

class ReviewFormBloc extends Bloc<ReviewFormEvent, ReviewFormState> {
  ReviewFormBloc() : super(const ReviewFormState()) {
    reviewController.addListener(_handleEdited);
    nameController.addListener(_handleEdited);
    emailController.addListener(_handleEdited);

    on<ReviewRatingChanged>(_onRatingChanged);
    on<ReviewSaveDetailsChanged>(_onSaveDetailsChanged);
    on<ReviewFormEdited>(_onFormEdited);
    on<ReviewSubmitted>(_onSubmitted);
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController reviewController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _suppressInputEvents = false;

  String? validateReview(String? value) {
    return _isBlank(value) ? 'Please enter your review.' : null;
  }

  String? validateName(String? value) {
    return _isBlank(value) ? 'Please enter your name.' : null;
  }

  String? validateEmail(String? value) {
    final String email = value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Please enter your email.';
    }

    if (!email.contains('@')) {
      return 'Please enter a valid email.';
    }

    return null;
  }

  void _handleEdited() {
    if (_suppressInputEvents) {
      return;
    }

    add(const ReviewFormEdited());
  }

  void _onRatingChanged(
    ReviewRatingChanged event,
    Emitter<ReviewFormState> emit,
  ) {
    emit(
      state.copyWith(
        rating: event.rating,
        ratingError: null,
        successMessage: null,
      ),
    );
  }

  void _onSaveDetailsChanged(
    ReviewSaveDetailsChanged event,
    Emitter<ReviewFormState> emit,
  ) {
    emit(state.copyWith(saveDetails: event.value, successMessage: null));
  }

  void _onFormEdited(ReviewFormEdited event, Emitter<ReviewFormState> emit) {
    if (state.successMessage == null) {
      return;
    }

    emit(state.copyWith(successMessage: null));
  }

  void _onSubmitted(ReviewSubmitted event, Emitter<ReviewFormState> emit) {
    final bool isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      return;
    }

    if (state.rating == 0) {
      emit(
        state.copyWith(
          ratingError: 'Please select a rating.',
          successMessage: null,
        ),
      );
      return;
    }

    _suppressInputEvents = true;
    reviewController.clear();
    nameController.clear();
    emailController.clear();
    _suppressInputEvents = false;

    emit(
      state.copyWith(
        rating: 0,
        saveDetails: false,
        ratingError: null,
        successMessage: 'Your review was submitted successfully.',
      ),
    );
  }

  bool _isBlank(String? value) {
    return value == null || value.trim().isEmpty;
  }

  @override
  Future<void> close() {
    reviewController.dispose();
    nameController.dispose();
    emailController.dispose();
    return super.close();
  }
}
