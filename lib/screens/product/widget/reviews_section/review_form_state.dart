class ReviewFormState {
  const ReviewFormState({
    this.rating = 0,
    this.saveDetails = false,
    this.successMessage,
    this.ratingError,
  });

  static const Object _unset = Object();

  final int rating;
  final bool saveDetails;
  final String? successMessage;
  final String? ratingError;

  ReviewFormState copyWith({
    int? rating,
    bool? saveDetails,
    Object? successMessage = _unset,
    Object? ratingError = _unset,
  }) {
    return ReviewFormState(
      rating: rating ?? this.rating,
      saveDetails: saveDetails ?? this.saveDetails,
      successMessage: identical(successMessage, _unset)
          ? this.successMessage
          : successMessage as String?,
      ratingError: identical(ratingError, _unset)
          ? this.ratingError
          : ratingError as String?,
    );
  }
}
