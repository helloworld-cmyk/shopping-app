import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';

class ProductInfoHeader extends StatelessWidget {
  final String name;
  final double rating;
  final int reviewCount;
  final String soldLabel;
  final String description;

  const ProductInfoHeader({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.soldLabel,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '$rating ($reviewCount)',
                    style: GoogleFonts.poppins(
                      color: AppColors.mediumGray,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                soldLabel,
                style: GoogleFonts.poppins(
                  color: AppColors.mediumGray,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: GoogleFonts.bebasNeue(
              fontSize: 26,
              color: AppColors.black,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.poppins(
              color: AppColors.mediumGray,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
