import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/addressBloc/bloc.dart';

import '../../../bloc/addressBloc/state.dart';
import '../../../models/address_model.dart';
import '../../../router/app_router.dart';
import '../../../theme/color.dart';

class CheckoutAddressSection extends StatelessWidget {
  const CheckoutAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        final selectedAddress = state.selectedAddress;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.router.push(const AddressRoute());
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              decoration: const BoxDecoration(color: Color(0xF9F9F9F9)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: selectedAddress == null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select delivery address',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                  height: 1,
                                  letterSpacing: 0,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Tap to choose or add a new address',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray,
                                  height: 1,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          )
                        : _SelectedAddressInfo(address: selectedAddress),
                  ),
                  const SizedBox(width: 12),
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SelectedAddressInfo extends StatelessWidget {
  const _SelectedAddressInfo({required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address.name,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            height: 1,
            letterSpacing: 0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        Text(
          address.address,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGray,
            height: 1,
            letterSpacing: 0,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          address.email,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGray,
            height: 1,
            letterSpacing: 0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          address.phone,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGray,
            height: 1,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
