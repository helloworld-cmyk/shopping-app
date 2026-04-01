import 'package:flutter/material.dart';

class PaymentCardModel {
  final String id;
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final List<Color> gradientColors;

  const PaymentCardModel({
    required this.id,
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
    required this.gradientColors,
  });
}

const List<PaymentCardModel> mockCards = [
  PaymentCardModel(
    id: '1',
    cardHolder: 'JOHN H. SMITH',
    cardNumber: '1234  5678  9101  1121',
    expiryDate: '09/29',
    gradientColors: [
      Color(0xFFF1DCB2), // Light yellow
      Color(0xFFC3E5D9), // Light teal
    ],
  ),
  PaymentCardModel(
    id: '2',
    cardHolder: 'JOHN H. SMITH',
    cardNumber: '1234  5678  9101  1121',
    expiryDate: '09/29',
    gradientColors: [
      Color(0xFFBD6D51), // Reddish brown
      Color(0xFF915444), // Darker brown
    ],
  ),
  PaymentCardModel(
    id: '3',
    cardHolder: 'JOHN H. SMITH',
    cardNumber: '1234  5678  9101  1121',
    expiryDate: '09/29',
    gradientColors: [
      Color(0xFF6A819C), // Gray blue
      Color(0xFF4A556C), // Dark blue gray
    ],
  ),
];
