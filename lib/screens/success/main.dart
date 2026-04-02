import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../router/app_router.dart';
import '../../../theme/color.dart';
import '../../../bloc/cartBloc/bloc.dart';
import 'widget/success_icon.dart';

@RoutePage()
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Clear cart items on successful order completion
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartBloc>().add(ClearCart());
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SuccessIcon(),
              const SizedBox(height: 48),
              Text(
                'ORDER SUCCESS',
                style: GoogleFonts.bebasNeue(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: AppColors.black,
                  letterSpacing: 0,
                  height: 1,
                  textBaseline: TextBaseline.alphabetic,
                ),
                // text-transform: capitalize (Flutter không hỗ trợ trực tiếp, cần xử lý text trước nếu muốn)
              ),
              const SizedBox(height: 16),
              Text(
                'Dolor magna eget est lorem ipsum dolor\nsit amet consectetur.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: AppColors.mediumGray,
                  letterSpacing: 0,
                  height: 16 / 12, // line-height 16px for 12px font
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.replaceAll([const MyOrderRoute()]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'MY ORDERS'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: AppColors.white,
                      letterSpacing: 0,
                      height: 1,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    context.router.replaceAll([const HomeRoute()]);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE8E8E8)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'CONTINUE SHOPPING'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: AppColors.black,
                      letterSpacing: 0,
                      height: 1,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
