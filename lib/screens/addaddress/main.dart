import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/addressBloc/bloc.dart';
import '../../bloc/addressBloc/event.dart';
import '../../bloc/addressBloc/state.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/billing_form_section.dart';
import 'widget/location_map_section.dart';
import 'widget/confirm_button.dart';

@RoutePage()
class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(const AddressFormStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressBloc, AddressState>(
      listenWhen: (previous, current) =>
          previous.formStatus != current.formStatus ||
          previous.formMessage != current.formMessage,
      listener: (context, state) {
        if (state.formStatus == AddressFormStatus.validationError &&
            state.formMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.formMessage!)));
          context.read<AddressBloc>().add(const AddressFormFeedbackCleared());
        }

        if (state.formStatus == AddressFormStatus.success) {
          context.read<AddressBloc>().add(const AddressFormFeedbackCleared());
          context.router.maybePop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                CommonAppBar(
                  title: 'NEW ADDRESS',
                  onBack: () => context.router.maybePop(),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Text(
                                'BILLING DETAILS',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                  letterSpacing: 0.5,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Divider(
                                color: AppColors.subtleLine,
                                thickness: 1,
                                height: 1,
                              ),
                            ),
                            const SizedBox(height: 16),
                            BillingFormSection(
                              firstName: state.firstName,
                              lastName: state.lastName,
                              street: state.street,
                              city: state.city,
                              phone: state.phone,
                              email: state.email,
                              selectedCountry: state.selectedCountry,
                              phoneCode: state.phoneCode,
                              onFirstNameChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressFormFieldChanged(
                                    field: AddressFormField.firstName,
                                    value: value,
                                  ),
                                );
                              },
                              onLastNameChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressFormFieldChanged(
                                    field: AddressFormField.lastName,
                                    value: value,
                                  ),
                                );
                              },
                              onStreetChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressFormFieldChanged(
                                    field: AddressFormField.street,
                                    value: value,
                                  ),
                                );
                              },
                              onCityChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressFormFieldChanged(
                                    field: AddressFormField.city,
                                    value: value,
                                  ),
                                );
                              },
                              onPhoneChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressFormFieldChanged(
                                    field: AddressFormField.phone,
                                    value: value,
                                  ),
                                );
                              },
                              onEmailChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressFormFieldChanged(
                                    field: AddressFormField.email,
                                    value: value,
                                  ),
                                );
                              },
                              onCountryChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressCountryChanged(value),
                                );
                              },
                              onPhoneCodeChanged: (value) {
                                context.read<AddressBloc>().add(
                                  AddressPhoneCodeChanged(value),
                                );
                              },
                            ),
                            const SizedBox(height: 28),
                            const LocationMapSection(),
                            const SizedBox(height: 28),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Set Default Address',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                      height: 1,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 28,
                                    child: Switch(
                                      value: state.isDefault,
                                      onChanged: (value) {
                                        context.read<AddressBloc>().add(
                                          AddressDefaultChanged(value),
                                        );
                                      },
                                      activeThumbColor: AppColors.white,
                                      activeTrackColor: AppColors.primary,
                                      inactiveThumbColor: AppColors.white,
                                      inactiveTrackColor:
                                          AppColors.extraLightGray,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 25,
                        right: 25,
                        bottom: MediaQuery.of(context).padding.bottom + 16,
                        child: ConfirmButton(
                          onPressed: () {
                            context.read<AddressBloc>().add(
                              const AddressFormSubmitted(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
