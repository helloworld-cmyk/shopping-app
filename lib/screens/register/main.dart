import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';
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
      child: BlocProvider(
        create: (_) => SignUpBloc(),
        child: BlocListener<SignUpBloc, SignUpState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.feedbackMessage != null,
          listener: (context, state) {
            if (state.isSuccess) {
              final messenger = ScaffoldMessenger.of(context);
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.feedbackMessage ?? 'Registration successful!'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color(0xFF388E3C),
                  ),
                );

              if (onSignedUp != null) {
                onSignedUp!();
              }
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
              context.read<SignUpBloc>().add(const SignUpFeedbackCleared());
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                final signUpBloc = context.read<SignUpBloc>();

                return SingleChildScrollView(
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
                              initialValue: state.firstName.isEmpty ? null : state.firstName,
                              onChanged: (value) => signUpBloc.add(SignUpFirstNameChanged(value)),
                              errorText: state.firstNameError,
                              enabled: !state.isSubmitting,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SignUpLineField(
                              hintText: 'Last name',
                              initialValue: state.lastName.isEmpty ? null : state.lastName,
                              onChanged: (value) => signUpBloc.add(SignUpLastNameChanged(value)),
                              errorText: state.lastNameError,
                              enabled: !state.isSubmitting,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SignUpLineField(
                        label: 'Email',
                        initialValue: state.email.isEmpty ? null : state.email,
                        onChanged: (value) => signUpBloc.add(SignUpEmailChanged(value)),
                        errorText: state.emailError,
                        enabled: !state.isSubmitting,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 30),
                      SignUpLineField(
                        label: 'Phone Number',
                        hintText: '+1 000 000 0000',
                        initialValue: state.phoneNumber.isEmpty ? null : state.phoneNumber,
                        onChanged: (value) => signUpBloc.add(SignUpPhoneNumberChanged(value)),
                        errorText: state.phoneNumberError,
                        enabled: !state.isSubmitting,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 30),
                      SignUpPasswordField(
                        label: 'Password',
                        obscureText: state.isPasswordObscured,
                        onToggleVisibility: () => signUpBloc.add(const SignUpPasswordVisibilityToggled()),
                        onChanged: (value) => signUpBloc.add(SignUpPasswordChanged(value)),
                        errorText: state.passwordError,
                        enabled: !state.isSubmitting,
                      ),
                      const SizedBox(height: 30),
                      SignUpPasswordField(
                        label: 'Confirm Password',
                        obscureText: state.isConfirmPasswordObscured,
                        onToggleVisibility: () => signUpBloc.add(const SignUpConfirmPasswordVisibilityToggled()),
                        onChanged: (value) => signUpBloc.add(SignUpConfirmPasswordChanged(value)),
                        errorText: state.confirmPasswordError,
                        enabled: !state.isSubmitting,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => signUpBloc.add(const SignUpSubmitted()),
                      ),
                      const SizedBox(height: 52),
                      SignUpPrimaryButton(
                        label: state.isSubmitting ? 'SIGNING UP...' : 'SIGN UP',
                        onPressed: state.isSubmitting
                            ? null
                            : () {
                                signUpBloc.add(const SignUpSubmitted());
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
