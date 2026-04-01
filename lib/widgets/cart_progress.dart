import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color.dart';

class CartProgressStepper extends StatelessWidget {
  final int currentStep; // 0: Cart, 1: Checkout, 2: Delivery

  const CartProgressStepper({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildStepCircle(0),
              _buildDottedLine(),
              _buildStepCircle(1),
              _buildDottedLine(),
              _buildStepCircle(2),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStepLabel('Cart', 0),
                    _buildStepLabel('Delivery', 2),
                  ],
                ),
                _buildCenteredStepLabel('Checkout', 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCircle(int step) {
    final isActive = step <= currentStep;

    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: isActive ? AppColors.black : AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColors.black : const Color(0xFFE8E8E8),
          width: isActive ? 0 : 1,
        ),
      ),
    );
  }

  Widget _buildDottedLine() {
    return Expanded(
      child: Container(
        height: 1,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final boxWidth = constraints.constrainWidth();
            const dashWidth = 2.0;
            const dashSpace = 2.0;
            final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(dashCount, (_) {
                return SizedBox(
                  width: dashWidth,
                  height: 1,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStepLabel(String label, int step) {
    final isActive = step <= currentStep;
    return Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 10,
        color: isActive ? AppColors.black : AppColors.mediumGray,
        fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
      ),
    );
  }

  Widget _buildCenteredStepLabel(String label, int step) {
    return Align(
      alignment: Alignment.center,
      child: _buildStepLabel(label, step),
    );
  }
}