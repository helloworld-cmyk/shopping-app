import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  String _selectedCountry = 'UNITED STATES';
  String _phoneCode = '+1';
  bool _isDefault = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        // ── Section title ──
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
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

                        // ── Billing form fields ──
                        BillingFormSection(
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                          streetController: _streetController,
                          cityController: _cityController,
                          phoneController: _phoneController,
                          emailController: _emailController,
                          selectedCountry: _selectedCountry,
                          phoneCode: _phoneCode,
                          onCountryChanged: (val) {
                            setState(() => _selectedCountry = val);
                          },
                          onPhoneCodeChanged: (val) {
                            setState(() => _phoneCode = val);
                          },
                        ),

                        const SizedBox(height: 28),

                        // ── Choose Location map section ──
                        const LocationMapSection(),

                        const SizedBox(height: 28),

                        // ── Set Default Address toggle ──
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  value: _isDefault,
                                  onChanged: (val) {
                                    setState(() => _isDefault = val);
                                  },
                                  activeColor: AppColors.white,
                                  activeTrackColor: AppColors.primary,
                                  inactiveThumbColor: AppColors.white,
                                  inactiveTrackColor: AppColors.extraLightGray,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bottom padding for floating button
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),

                  // ── Floating Confirm button ──
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    child: ConfirmButton(
                      onPressed: () {
                        // Handle confirm action
                        context.router.maybePop();
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
  }
}
