import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/profileBloc/bloc.dart';
import '../../bloc/profileBloc/event.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/profile_detail_row.dart';
import 'widget/profile_identity_section.dart';

@RoutePage()
class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileFormStarted());
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileBloc>().state;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonAppBar(
                title: 'PROFILE',
                onBack: () => context.router.maybePop(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 28, 25, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileIdentitySection(
                      avatarUrl: profile.avatarUrl,
                      name: profile.previewFullName,
                      username: profile.previewUsername,
                    ),
                    const SizedBox(height: 54),
                    ProfileDetailRow(
                      label: 'Name',
                      value: profile.formFullName,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                          ProfileFieldChanged(
                            field: ProfileField.fullName,
                            value: value,
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      label: 'Username',
                      value: profile.formUsername,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                          ProfileFieldChanged(
                            field: ProfileField.username,
                            value: value,
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      label: 'Date of birth',
                      value: profile.formDateOfBirth,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                          ProfileFieldChanged(
                            field: ProfileField.dateOfBirth,
                            value: value,
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      label: 'Phone Number',
                      value: profile.formPhoneNumber,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                          ProfileFieldChanged(
                            field: ProfileField.phoneNumber,
                            value: value,
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      label: 'Gender',
                      value: profile.formGender,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                          ProfileFieldChanged(
                            field: ProfileField.gender,
                            value: value,
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      label: 'Email',
                      value: profile.formEmail,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                          ProfileFieldChanged(
                            field: ProfileField.email,
                            value: value,
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      label: 'Region',
                      value: profile.formRegion,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                          ProfileFieldChanged(
                            field: ProfileField.region,
                            value: value,
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      label: 'Password',
                      trailing: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Change Password',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                            height: 1,
                          ),
                        ),
                      ),
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
