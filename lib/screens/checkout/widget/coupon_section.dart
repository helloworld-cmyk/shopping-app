import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coupon Code',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: const Color(0xFFCFCFCF),
                  letterSpacing: 0,
                  height: 1,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
              Text(
                'Apply Coupon',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppColors.black,
                  letterSpacing: 0,
                  height: 1,
                  textBaseline: TextBaseline.alphabetic,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE9E9E9), height: 1),
        ],
      ),
    );
  }
}
