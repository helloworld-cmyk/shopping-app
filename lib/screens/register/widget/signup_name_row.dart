import 'package:flutter/material.dart';

import 'signup_colors.dart';

class SignUpNameRow extends StatelessWidget {
  const SignUpNameRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _NameField(hintText: 'First name')),
        SizedBox(width: 14),
        Expanded(child: _NameField(hintText: 'Last name')),
      ],
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: kSignUpText,
      fontSize: 14,
      height: 1.0,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    );

    return TextFormField(
      textInputAction: TextInputAction.next,
      cursorColor: kSignUpOrange,
      style: style,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        hintText: hintText,
        hintStyle: style?.copyWith(color: kSignUpMuted),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: kSignUpLine, width: 1),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kSignUpLine, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kSignUpOrange, width: 1.1),
        ),
      ),
    );
  }
}
