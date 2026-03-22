import 'package:flutter/material.dart';

import 'signup_line_field.dart';

class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({
    super.key,
    required this.label,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
  });

  final String label;
  final TextInputAction textInputAction;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SignUpLineField(
      hintText: label,
      obscureText: true,
      textInputAction: textInputAction,
      enabled: enabled,
      suffixIcon: IconButton(
        onPressed: null,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints.tightFor(width: 24, height: 24),
        icon: const Icon(
          Icons.visibility_off_outlined,
          color: Color(0xFFB5B5B5),
          size: 18,
        ),
      ),
    );
  }
}
