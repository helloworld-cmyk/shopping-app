import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardState()) {
    on<AddCardFormStarted>(_onAddCardFormStarted);
    on<AddCardFieldChanged>(_onAddCardFieldChanged);
    on<AddCardSubmitted>(_onAddCardSubmitted);
    on<AddCardFeedbackCleared>(_onAddCardFeedbackCleared);
    on<AddCard>(_onAddCard);
    on<SelectCard>(_onSelectCard);
  }

  void _onAddCardFormStarted(
    AddCardFormStarted event,
    Emitter<CardState> emit,
  ) {
    emit(
      state.copyWith(
        resetAddCardDraft: true,
        addCardStatus: AddCardSubmissionStatus.idle,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCardFieldChanged(
    AddCardFieldChanged event,
    Emitter<CardState> emit,
  ) {
    emit(
      _copyWithDraftField(field: event.field, value: event.value).copyWith(
        addCardStatus: AddCardSubmissionStatus.idle,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCardSubmitted(AddCardSubmitted event, Emitter<CardState> emit) {
    final cardHolder = state.formCardHolder.trim().toUpperCase();
    final cardNumber = state.formCardNumber.trim();
    final expMonth = state.formExpMonth.trim();
    final expDate = state.formExpDate.trim();
    final cvv = state.formCvv.trim();
    final requiredValues = [cardHolder, cardNumber, expMonth, expDate, cvv];

    if (requiredValues.any((value) => value.isEmpty)) {
      emit(
        state.copyWith(
          addCardStatus: AddCardSubmissionStatus.failure,
          addCardFeedbackMessage: 'Please fill in all required fields.',
        ),
      );
      return;
    }

    final card = PaymentCardModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      cardHolder: cardHolder,
      cardNumber: cardNumber,
      expiryDate: '${expMonth.padLeft(2, '0')}/${expDate.padLeft(2, '0')}',
      gradientColors: cardGradients[state.cards.length % cardGradients.length],
    );

    emit(
      state.copyWith(
        cards: [...state.cards, card],
        selectedCardId: card.id,
        resetAddCardDraft: true,
        addCardStatus: AddCardSubmissionStatus.success,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCardFeedbackCleared(
    AddCardFeedbackCleared event,
    Emitter<CardState> emit,
  ) {
    emit(
      state.copyWith(
        addCardStatus: AddCardSubmissionStatus.idle,
        clearAddCardFeedbackMessage: true,
      ),
    );
  }

  void _onAddCard(AddCard event, Emitter<CardState> emit) {
    emit(
      state.copyWith(
        cards: [...state.cards, event.card],
        selectedCardId: event.card.id,
      ),
    );
  }

  void _onSelectCard(SelectCard event, Emitter<CardState> emit) {
    final exists = state.cards.any((card) => card.id == event.cardId);
    if (!exists) {
      return;
    }

    emit(state.copyWith(selectedCardId: event.cardId));
  }

  CardState _copyWithDraftField({
    required AddCardField field,
    required String value,
  }) {
    switch (field) {
      case AddCardField.cardHolder:
        return state.copyWith(draftCardHolder: value);
      case AddCardField.cardNumber:
        return state.copyWith(draftCardNumber: value);
      case AddCardField.expMonth:
        return state.copyWith(draftExpMonth: value);
      case AddCardField.expDate:
        return state.copyWith(draftExpDate: value);
      case AddCardField.cvv:
        return state.copyWith(draftCvv: value);
    }
  }
}
