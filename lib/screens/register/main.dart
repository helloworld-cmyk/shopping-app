import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color.dart';
import 'widget/signup_back_button.dart';
import 'widget/signup_colors.dart';
import 'widget/signup_line_field.dart';
import 'widget/signup_password_field.dart';
import 'widget/signup_primary_button.dart';
import 'widget/signup_social_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, this.onBack, this.onSignedUp});

  final VoidCallback? onBack;
  final VoidCallback? onSignedUp;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).padding;
    final theme = Theme.of(context);
    final signUpTextTheme = GoogleFonts.poppinsTextTheme(theme.textTheme);

    return Theme(
      data: theme.copyWith(
        textTheme: signUpTextTheme.copyWith(
          displayLarge: signUpTextTheme.displayLarge?.copyWith(height: 1.0),
          displayMedium: signUpTextTheme.displayMedium?.copyWith(height: 1.0),
          displaySmall: signUpTextTheme.displaySmall?.copyWith(height: 1.0),
          headlineMedium: signUpTextTheme.headlineMedium?.copyWith(height: 1.0),
          headlineSmall: signUpTextTheme.headlineSmall?.copyWith(height: 1.0),
          bodySmall: signUpTextTheme.bodySmall?.copyWith(height: 1.0),
          bodyMedium: signUpTextTheme.bodyMedium?.copyWith(height: 1.0),
          labelLarge: signUpTextTheme.labelLarge?.copyWith(
            height: 1.0,
            letterSpacing: 0.2,
          ),
          labelMedium: signUpTextTheme.labelMedium?.copyWith(
            height: 1.0,
            letterSpacing: 0.2,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            24,
            viewPadding.top + 10,
            24,
            20 + viewPadding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SignUpBackButton(
                  onTap: () {
                    if (onBack != null) {
                      onBack!.call();
                      return;
                    }
                    Navigator.of(context).maybePop();
                  },
                ),
              ),
              const SizedBox(height: 34),
              Text(
                'Create your account',
                style: GoogleFonts.bebasNeue(
                  textStyle: theme.textTheme.displaySmall,
                  fontSize: 30,
                  height: 1.0,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  color: kSignUpText,
                ),
              ),
              const SizedBox(height: 64),
              Row(
                children: [
                  Expanded(
                    child: SignUpLineField(
                      hintText: 'First name',
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SignUpLineField(
                      hintText: 'Last name',
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const SignUpLineField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 30),
              const SignUpLineField(
                label: 'Phone Number',
                hintText: '+1 000 000 0000',
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 30),
              const SignUpPasswordField(label: 'Password'),
              const SizedBox(height: 30),
              const SignUpPasswordField(
                label: 'Confirm Password',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 52),
              SignUpPrimaryButton(
                label: 'SIGN UP',
                onPressed: () {
                  if (onSignedUp != null) {
                    onSignedUp!();
                  }
                },
              ),
              const SizedBox(height: 10),
              const SignUpSocialButton(
                label: 'SIGN UP WITH GOOGLE',
                leading: SignUpGoogleLogoMark(),
              ),
              const SizedBox(height: 8),
              const SignUpSocialButton(
                label: 'SIGN UP WITH FACEBOOK',
                leading: SignUpFacebookLogoMark(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
