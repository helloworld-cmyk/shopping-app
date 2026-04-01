import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class BillingFormSection extends StatelessWidget {
  const BillingFormSection({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.streetController,
    required this.cityController,
    required this.phoneController,
    required this.emailController,
    required this.selectedCountry,
    required this.phoneCode,
    required this.onCountryChanged,
    required this.onPhoneCodeChanged,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final String selectedCountry;
  final String phoneCode;
  final ValueChanged<String> onCountryChanged;
  final ValueChanged<String> onPhoneCodeChanged;

  // ───────────────────────────────────────────────
  // Shared text styles
  // ───────────────────────────────────────────────

  TextStyle get _labelStyle => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGray,
        height: 1,
        letterSpacing: 0,
      );

  TextStyle get _inputStyle => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  TextStyle get _hintStyle => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.extraLightGray,
        height: 1.4,
        letterSpacing: 0,
      );

  InputDecoration _underlineDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: _hintStyle,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 6),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.subtleLine, width: 1),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }

  // ───────────────────────────────────────────────
  // Build
  // ───────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── First name / Last name row ──
          Row(
            children: [
              Expanded(
                child: _LabeledField(
                  label: 'First name *',
                  labelStyle: _labelStyle,
                  child: TextField(
                    controller: firstNameController,
                    style: _inputStyle,
                    decoration: _underlineDecoration(''),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _LabeledField(
                  label: 'Last name *',
                  labelStyle: _labelStyle,
                  child: TextField(
                    controller: lastNameController,
                    style: _inputStyle,
                    decoration: _underlineDecoration(''),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ── Country / Region dropdown ──
          _LabeledField(
            label: 'Country / Region *',
            labelStyle: _labelStyle,
            child: _CountryDropdown(
              value: selectedCountry,
              onChanged: onCountryChanged,
              inputStyle: _inputStyle,
            ),
          ),

          const SizedBox(height: 24),

          // ── Street address ──
          _LabeledField(
            label: '',
            labelStyle: _labelStyle,
            child: TextField(
              controller: streetController,
              style: _inputStyle,
              decoration: _underlineDecoration('Street address *'),
            ),
          ),

          const SizedBox(height: 24),

          // ── Town / City ──
          _LabeledField(
            label: '',
            labelStyle: _labelStyle,
            child: TextField(
              controller: cityController,
              style: _inputStyle,
              decoration: _underlineDecoration('Town / City *'),
            ),
          ),

          const SizedBox(height: 24),

          // ── Phone number with code ──
          _PhoneField(
            phoneCode: phoneCode,
            controller: phoneController,
            inputStyle: _inputStyle,
            hintStyle: _hintStyle,
            onCodeChanged: onPhoneCodeChanged,
          ),

          const SizedBox(height: 24),

          // ── Email address ──
          _LabeledField(
            label: '',
            labelStyle: _labelStyle,
            child: TextField(
              controller: emailController,
              style: _inputStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: _underlineDecoration('Email address *'),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════
// Private helper widgets
// ═══════════════════════════════════════════════════

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.labelStyle,
    required this.child,
  });

  final String label;
  final TextStyle labelStyle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: labelStyle),
          const SizedBox(height: 2),
        ],
        child,
      ],
    );
  }
}

class _CountryDropdown extends StatelessWidget {
  const _CountryDropdown({
    required this.value,
    required this.onChanged,
    required this.inputStyle,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final TextStyle inputStyle;

  static const _countries = [
    'UNITED STATES',
    'CANADA',
    'UNITED KINGDOM',
    'AUSTRALIA',
    'GERMANY',
    'FRANCE',
    'JAPAN',
    'VIETNAM',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.subtleLine, width: 1),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
            size: 22,
          ),
          style: inputStyle,
          items: _countries.map((c) {
            return DropdownMenuItem(
              value: c,
              child: Text(c, style: inputStyle),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) onChanged(val);
          },
        ),
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({
    required this.phoneCode,
    required this.controller,
    required this.inputStyle,
    required this.hintStyle,
    required this.onCodeChanged,
  });

  final String phoneCode;
  final TextEditingController controller;
  final TextStyle inputStyle;
  final TextStyle hintStyle;
  final ValueChanged<String> onCodeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.subtleLine, width: 1),
        ),
      ),
      child: Row(
        children: [
          // Country code
          GestureDetector(
            onTap: () {
              // Could show a picker; for now cycle through common codes
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8, top: 6),
              child: Text(phoneCode, style: inputStyle),
            ),
          ),
          Container(
            width: 1,
            height: 20,
            color: AppColors.subtleLine,
          ),
          const SizedBox(width: 12),
          // Phone input
          Expanded(
            child: TextField(
              controller: controller,
              style: inputStyle,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone number',
                hintStyle: hintStyle,
                contentPadding: const EdgeInsets.only(bottom: 10, top: 6),
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
