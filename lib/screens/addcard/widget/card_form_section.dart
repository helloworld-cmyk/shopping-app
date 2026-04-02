import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class CardFormSection extends StatelessWidget {
  const CardFormSection({
    super.key,
    required this.name,
    required this.cardNumber,
    required this.expMonth,
    required this.expDate,
    required this.cvv,
    required this.onNameChanged,
    required this.onCardNumberChanged,
    required this.onExpMonthChanged,
    required this.onExpDateChanged,
    required this.onCvvChanged,
  });

  final String name;
  final String cardNumber;
  final String expMonth;
  final String expDate;
  final String cvv;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onCardNumberChanged;
  final ValueChanged<String> onExpMonthChanged;
  final ValueChanged<String> onExpDateChanged;
  final ValueChanged<String> onCvvChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            value: name,
            onChanged: onNameChanged,
            label: 'Name On Card',
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          ),

          const SizedBox(height: 20),

          _buildTextField(
            value: cardNumber,
            onChanged: onCardNumberChanged,
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
                  value: expMonth,
                  onChanged: onExpMonthChanged,
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
                  value: expDate,
                  onChanged: onExpDateChanged,
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

          _buildTextField(
            value: cvv,
            onChanged: onCvvChanged,
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
    required String value,
    required ValueChanged<String> onChanged,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return _CardInputField(
      value: value,
      onChanged: onChanged,
      label: label,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
    );
  }
}

class _CardInputField extends StatefulWidget {
  const _CardInputField({
    required this.value,
    required this.onChanged,
    required this.label,
    required this.keyboardType,
    required this.obscureText,
    this.inputFormatters,
    required this.textCapitalization,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  @override
  State<_CardInputField> createState() => _CardInputFieldState();
}

class _CardInputFieldState extends State<_CardInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant _CardInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == _controller.text) {
      return;
    }

    _controller.value = _controller.value.copyWith(
      text: widget.value,
      selection: TextSelection.collapsed(offset: widget.value.length),
      composing: TextRange.empty,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization,
      onChanged: widget.onChanged,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        letterSpacing: 0,
        height: 1.4,
      ),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: widget.label,
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
