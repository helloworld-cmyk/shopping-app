import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/bloc.dart';
import '../../bloc/event.dart';
import '../../theme/color.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';
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
      child: BlocProvider(
        create: (_) => SignInBloc(),
        child: BlocListener<SignInBloc, SignInState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.feedbackMessage != null,
          listener: (context, state) {
            if (state.isSuccess) {
              context.read<AuthBloc>().add(const AuthSignedIn());
              return;
            }

            if (state.isFailure) {
              final messenger = ScaffoldMessenger.of(context);
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.feedbackMessage!),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color(0xFFC62828),
                  ),
                );
              context.read<SignInBloc>().add(const SignInFeedbackCleared());
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                final signInBloc = context.read<SignInBloc>();

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SignInHeroBanner(
                        onBack: () => Navigator.of(context).maybePop(),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          31,
                          0,
                          31,
                          24 + bottomPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SignInEmailField(
                              initialValue: state.email.isEmpty
                                  ? null
                                  : state.email,
                              onChanged: (value) {
                                signInBloc.add(SignInEmailChanged(value));
                              },
                              errorText: state.emailError,
                              enabled: !state.isSubmitting,
                            ),
                            const SizedBox(height: 18),
                            SignInPasswordField(
                              obscureText: state.isPasswordObscured,
                              onToggleVisibility: () {
                                signInBloc.add(
                                  const SignInPasswordVisibilityToggled(),
                                );
                              },
                              onChanged: (value) {
                                signInBloc.add(SignInPasswordChanged(value));
                              },
                              errorText: state.passwordError,
                              enabled: !state.isSubmitting,
                              onFieldSubmitted: (_) {
                                signInBloc.add(const SignInSubmitted());
                              },
                            ),
                            const SizedBox(height: 12),
                            SignInRememberRow(
                              isSelected: state.isRememberMe,
                              onRememberTap: () {
                                signInBloc.add(const SignInRememberMeToggled());
                              },
                            ),
                            const SizedBox(height: 29),
                            SignInPrimaryButton(
                              label: state.isSubmitting
                                  ? 'SIGNING IN...'
                                  : 'SIGN IN',
                              onPressed: state.isSubmitting
                                  ? null
                                  : () {
                                      signInBloc.add(const SignInSubmitted());
                                    },
                            ),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
