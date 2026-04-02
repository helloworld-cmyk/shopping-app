import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class CardPreview extends StatelessWidget {
  const CardPreview({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expMonth,
    required this.expDate,
  });

  final String cardNumber;
  final String cardHolder;
  final String expMonth;
  final String expDate;

  String get _displayNumber {
    final digits = cardNumber.replaceAll(RegExp(r'\s'), '');
    final padded = digits.padRight(16, '•');
    return '${padded.substring(0, 4)}   ${padded.substring(4, 8)}   ${padded.substring(8, 12)}   ${padded.substring(12, 16)}';
  }

  String get _displayHolder {
    return cardHolder.isEmpty ? 'YOUR NAME' : cardHolder.toUpperCase();
  }

  String get _displayExpiry {
    final m = expMonth.isEmpty ? 'MM' : expMonth.padLeft(2, '0');
    final d = expDate.isEmpty ? 'YY' : expDate.padLeft(2, '0');
    return '$m/$d';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF5F0EA), // Very light warm beige
            Color(0xFFEBE6E0), // Slightly darker warm beige
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),

            // ── Chip icon ──
            _buildChip(),

            const SizedBox(height: 20),

            // ── Card Number ──
            Text(
              _displayNumber,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.black.withValues(alpha: 0.7),
                letterSpacing: 2.0,
              ),
            ),

            const SizedBox(height: 16),

            // ── Holder & Expiry ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _displayHolder,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black.withValues(alpha: 0.65),
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Text(
                  _displayExpiry,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black.withValues(alpha: 0.65),
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip() {
    return Container(
      width: 44,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            right: 10,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(
                    color: Colors.black.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.black.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 16,
              height: 12,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.25),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
