import 'package:flutter/material.dart';

import 'signin_colors.dart';

class SignInLineField extends StatelessWidget {
  const SignInLineField({
    super.key,
    required this.label,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
    this.enabled = true,
  });

  final String label;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 1),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: kSignInMuted,
            fontSize: 10,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          enabled: enabled,
          cursorColor: kSignInOrange,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: kSignInText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.0,
            letterSpacing: 0,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignInLine, width: 1),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignInLine, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kSignInOrange, width: 1.1),
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints.tightFor(
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
