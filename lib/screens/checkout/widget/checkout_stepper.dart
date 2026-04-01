import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class CheckoutStepper extends StatelessWidget {
  final int currentStep;

  const CheckoutStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              _buildStep(0, "Cart"),
              _buildDivider(),
              _buildStep(1, "Checkout"),
              _buildDivider(),
              _buildStep(2, "Delivery"),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabel("Cart", 0),
              _buildLabel("Checkout", 1),
              _buildLabel("Delivery", 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int step, String label) {
    bool isCompleted = step < currentStep;
    bool isActive = step == currentStep;

    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive || isCompleted ? AppColors.black : AppColors.white,
        border: Border.all(
          color: isActive || isCompleted ? AppColors.black : AppColors.border,
          width: 1,
        ),
      ),
      child: isActive
          ? Center(
              child: Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildDivider() {
    return Expanded(
      child: Container(
        height: 1,
        color: AppColors.border,
        margin: const EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }

  Widget _buildLabel(String label, int step) {
    bool isActive = step == currentStep;
    return Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 10,
        color: isActive ? AppColors.black : AppColors.mediumGray,
      ),
    );
  }
}
