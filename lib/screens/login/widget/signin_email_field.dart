import 'package:flutter/material.dart';

import 'signin_line_field.dart';

class SignInEmailField extends StatelessWidget {
  const SignInEmailField({
    super.key,
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SignInLineField(
      label: 'Email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      enabled: enabled,
    );
  }
}
