import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../models/payment_card_model.dart';
import '../../../theme/color.dart';

class PaymentCardItem extends StatelessWidget {
  const PaymentCardItem({
    super.key,
    required this.cardInfo,
    required this.isSelected,
    required this.onTap,
  });

  final PaymentCardModel cardInfo;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: cardInfo.gradientColors,
          ),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 1.5)
              : Border.all(color: Colors.transparent, width: 1.5),
        ),
        child: Stack(
          children: [
            // Top Right Checkmark for selected item
            if (isSelected)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 10,
                  ),
                ),
              ),

            // Card details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),

                  // Chip placeholder using network image (transparent chip outline)
                  Container(
                    width: 44,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Simulating chip lines
                        Positioned(
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                vertical: BorderSide(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Inner box
                        Center(
                          child: Container(
                            width: 16,
                            height: 12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black.withValues(alpha: 0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Card number with a mono-space vibe using Poppins and letter spacing
                  Text(
                    cardInfo.cardNumber,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withValues(alpha: 0.75),
                      letterSpacing: 3.0,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Card Holder & Expiry Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardInfo.cardHolder,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withValues(alpha: 0.75),
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        cardInfo.expiryDate,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withValues(alpha: 0.75),
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
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
