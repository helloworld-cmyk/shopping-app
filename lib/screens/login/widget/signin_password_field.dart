import 'package:flutter/material.dart';

import 'signin_line_field.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({
    super.key,
    this.enabled = true,
    this.obscureText = true,
  });

  final bool enabled;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SignInLineField(
      label: 'Password',
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      enabled: enabled,
      suffixIcon: IconButton(
        onPressed: null,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints.tightFor(width: 24, height: 24),
        icon: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: const Color(0xFFB5B5B5),
          size: 18,
        ),
      ),
    );
  }
}
