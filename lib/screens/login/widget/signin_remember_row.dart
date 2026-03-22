import 'package:flutter/material.dart';

import 'signin_colors.dart';

class SignInRememberRow extends StatelessWidget {
  const SignInRememberRow({
    super.key,
    this.onRememberTap,
    this.onForgotPassword,
  });

  final VoidCallback? onRememberTap;
  final VoidCallback? onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onRememberTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _RememberCheckBox(),
              const SizedBox(width: 8),
              Text(
                'Remember Me',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: kSignInMuted,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onForgotPassword,
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: kSignInOrange,
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              height: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _RememberCheckBox extends StatelessWidget {
  const _RememberCheckBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: const Color(0xFFB7B7B7), width: 1),
      ),
      child: const Center(
        child: Icon(Icons.check, size: 9, color: Color(0xFF666666)),
      ),
    );
  }
}
