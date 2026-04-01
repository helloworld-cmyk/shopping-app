import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class CardFormSection extends StatelessWidget {
  const CardFormSection({
    super.key,
    required this.nameController,
    required this.cardNumberController,
    required this.expMonthController,
    required this.expDateController,
    required this.cvvController,
  });

  final TextEditingController nameController;
  final TextEditingController cardNumberController;
  final TextEditingController expMonthController;
  final TextEditingController expDateController;
  final TextEditingController cvvController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Name On Card ──
          _buildTextField(
            controller: nameController,
            label: 'Name On Card',
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          ),

          const SizedBox(height: 20),

          // ── Card Number ──
          _buildTextField(
            controller: cardNumberController,
            label: 'Card Number',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              _CardNumberFormatter(),
            ],
          ),

          const SizedBox(height: 20),

          // ── Exp Month & Exp Date row ──
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: expMonthController,
                  label: 'Exp Month',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildTextField(
                  controller: expDateController,
                  label: 'Exp Date',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── CVV ──
          _buildTextField(
            controller: cvvController,
            label: 'CVV',
            keyboardType: TextInputType.number,
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        letterSpacing: 0,
        height: 1.4,
      ),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGray,
          letterSpacing: 0,
          height: 1.4,
        ),
        floatingLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGray,
          letterSpacing: 0,
        ),
        contentPadding: const EdgeInsets.only(bottom: 8, top: 12),
        isDense: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.subtleLine, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}

/// Formats card numbers with spaces every 4 digits as user types.
class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(digits[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
