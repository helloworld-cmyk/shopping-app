import 'package:flutter/material.dart';

enum AddCardSubmissionStatus { idle, success, failure }

class PaymentCardModel {
  const PaymentCardModel({
    required this.id,
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
    required this.gradientColors,
  });

  final String id;
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final List<Color> gradientColors;

  String get lastFourDigits {
    final digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    if (digits.length <= 4) {
      return digits;
    }
    return digits.substring(digits.length - 4);
  }
}

class CardState {
  const CardState({
    this.cards = _initialCards,
    this.selectedCardId = '1',
    this.draftCardHolder = '',
    this.draftCardNumber = '',
    this.draftExpMonth = '',
    this.draftExpDate = '',
    this.draftCvv = '',
    this.addCardStatus = AddCardSubmissionStatus.idle,
    this.addCardFeedbackMessage,
  });

  final List<PaymentCardModel> cards;
  final String? selectedCardId;
  final String draftCardHolder;
  final String draftCardNumber;
  final String draftExpMonth;
  final String draftExpDate;
  final String draftCvv;
  final AddCardSubmissionStatus addCardStatus;
  final String? addCardFeedbackMessage;

  bool get isAddCardSuccess => addCardStatus == AddCardSubmissionStatus.success;
  bool get isAddCardFailure => addCardStatus == AddCardSubmissionStatus.failure;

  String get formCardHolder => draftCardHolder;
  String get formCardNumber => draftCardNumber;
  String get formExpMonth => draftExpMonth;
  String get formExpDate => draftExpDate;
  String get formCvv => draftCvv;

  PaymentCardModel? get selectedCard {
    for (final card in cards) {
      if (card.id == selectedCardId) {
        return card;
      }
    }
    return null;
  }

  CardState copyWith({
    List<PaymentCardModel>? cards,
    String? selectedCardId,
    String? draftCardHolder,
    String? draftCardNumber,
    String? draftExpMonth,
    String? draftExpDate,
    String? draftCvv,
    AddCardSubmissionStatus? addCardStatus,
    String? addCardFeedbackMessage,
    bool clearSelectedCard = false,
    bool clearAddCardFeedbackMessage = false,
    bool resetAddCardDraft = false,
  }) {
    return CardState(
      cards: cards ?? this.cards,
      selectedCardId: clearSelectedCard
          ? null
          : selectedCardId ?? this.selectedCardId,
      draftCardHolder: resetAddCardDraft
          ? ''
          : draftCardHolder ?? this.draftCardHolder,
      draftCardNumber: resetAddCardDraft
          ? ''
          : draftCardNumber ?? this.draftCardNumber,
      draftExpMonth: resetAddCardDraft
          ? ''
          : draftExpMonth ?? this.draftExpMonth,
      draftExpDate: resetAddCardDraft ? '' : draftExpDate ?? this.draftExpDate,
      draftCvv: resetAddCardDraft ? '' : draftCvv ?? this.draftCvv,
      addCardStatus: addCardStatus ?? this.addCardStatus,
      addCardFeedbackMessage: clearAddCardFeedbackMessage
          ? null
          : addCardFeedbackMessage ?? this.addCardFeedbackMessage,
    );
  }
}

const List<List<Color>> cardGradients = [
  [Color(0xFFF1DCB2), Color(0xFFC3E5D9)],
  [Color(0xFFBD6D51), Color(0xFF915444)],
  [Color(0xFF6A819C), Color(0xFF4A556C)],
  [Color(0xFFE7E0D8), Color(0xFFCFC4B8)],
];

const List<PaymentCardModel> _initialCards = [
  PaymentCardModel(
    id: '1',
    cardHolder: 'JOHN H. SMITH',
    cardNumber: '1234 5678 9101 1121',
    expiryDate: '09/29',
    gradientColors: [Color(0xFFF1DCB2), Color(0xFFC3E5D9)],
  ),
  PaymentCardModel(
    id: '2',
    cardHolder: 'JOHN H. SMITH',
    cardNumber: '4567 8910 1112 1314',
    expiryDate: '11/28',
    gradientColors: [Color(0xFFBD6D51), Color(0xFF915444)],
  ),
  PaymentCardModel(
    id: '3',
    cardHolder: 'JOHN H. SMITH',
    cardNumber: '9876 5432 1011 1213',
    expiryDate: '05/30',
    gradientColors: [Color(0xFF6A819C), Color(0xFF4A556C)],
  ),
];
