import 'package:flutter/material.dart';
import '../../models/payment_card_model.dart';

// [SOLID - SRP] Tách Mock Data ra khỏi logic và State
const List<List<Color>> cardGradients = [
  [Color(0xFFF1DCB2), Color(0xFFC3E5D9)],
  [Color(0xFFBD6D51), Color(0xFF915444)],
  [Color(0xFF6A819C), Color(0xFF4A556C)],
  [Color(0xFFE7E0D8), Color(0xFFCFC4B8)],
];

const List<PaymentCardModel> initialCardsMockData = [
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
