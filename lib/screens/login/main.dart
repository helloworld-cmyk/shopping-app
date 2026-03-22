import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color.dart';
import 'widget/signin_email_field.dart';
import 'widget/signin_footer.dart';
import 'widget/signin_hero_banner.dart';
import 'widget/signin_password_field.dart';
import 'widget/signin_primary_button.dart';
import 'widget/signin_remember_row.dart';
import 'widget/signin_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final theme = Theme.of(context);
    final signInTextTheme = GoogleFonts.poppinsTextTheme(theme.textTheme);

    return Theme(
      data: theme.copyWith(
        textTheme: signInTextTheme.copyWith(
          displayLarge: signInTextTheme.displayLarge?.copyWith(height: 1.0),
          displayMedium: signInTextTheme.displayMedium?.copyWith(height: 1.0),
          displaySmall: signInTextTheme.displaySmall?.copyWith(height: 1.0),
          headlineMedium: signInTextTheme.headlineMedium?.copyWith(height: 1.0),
          headlineSmall: signInTextTheme.headlineSmall?.copyWith(height: 1.0),
          bodyMedium: signInTextTheme.bodyMedium?.copyWith(height: 1.0),
          bodySmall: signInTextTheme.bodySmall?.copyWith(height: 1.0),
          labelLarge: signInTextTheme.labelLarge?.copyWith(
            height: 1.0,
            letterSpacing: 0.2,
          ),
          labelMedium: signInTextTheme.labelMedium?.copyWith(
            height: 1.0,
            letterSpacing: 0.2,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SignInHeroBanner(onBack: () => Navigator.of(context).maybePop()),
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.fromLTRB(31, 0, 31, 24 + bottomPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SignInEmailField(enabled: true),
                    const SizedBox(height: 18),
                    const SignInPasswordField(obscureText: true, enabled: true),
                    const SizedBox(height: 12),
                    const SignInRememberRow(),
                    const SizedBox(height: 29),
                    SignInPrimaryButton(label: 'SIGN IN', onPressed: () {}),
                    const SizedBox(height: 10),
                    const SignInSocialButton(
                      label: 'SIGN IN WITH GOOGLE',
                      leading: GoogleLogoMark(),
                    ),
                    const SizedBox(height: 8),
                    const SignInSocialButton(
                      label: 'SIGN IN WITH FACEBOOK',
                      leading: FacebookLogoMark(),
                    ),
                    const SizedBox(height: 28),
                    SignInFooter(
                      onRegisterTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
