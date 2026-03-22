import 'package:flutter/material.dart';

import 'signup_colors.dart';

class SignUpPhoneField extends StatelessWidget {
  const SignUpPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    final prefixStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: kSignUpMuted,
      fontSize: 14,
      height: 1.0,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    );

    final hintStyle = prefixStyle;

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: kSignUpLine, width: 1)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 1),
          Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 7),
            child: Text('+1', style: prefixStyle),
          ),
          const SizedBox(width: 12),
          Container(width: 1, height: 18, color: kSignUpLine),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              cursorColor: kSignUpOrange,
              style: prefixStyle?.copyWith(color: kSignUpText),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                border: InputBorder.none,
                hintText: 'Phone Number',
                hintStyle: hintStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
