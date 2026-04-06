import 'package:flutter/material.dart';

// [SOLID - SRP] Tách PaymentCardModel ra file riêng để file BLoC state chỉ quản lý state
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
