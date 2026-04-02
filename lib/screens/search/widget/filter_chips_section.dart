import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/mock_data.dart';
import '../../../theme/color.dart';

class FilterChipsSection extends StatelessWidget {
  const FilterChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: searchFilterCategories.map((category) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.subtleLine, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                category,
                style: GoogleFonts.poppins(
                  color: AppColors.mediumGray,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
