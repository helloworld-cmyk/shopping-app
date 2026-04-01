import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/mock_data.dart';
import '../../../theme/color.dart';

class FilterChipsSection extends StatelessWidget {
  const FilterChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          alignment: WrapAlignment.center,
          children: searchFilterCategories.map((category) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.subtleLine, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                category,
                style: GoogleFonts.poppins(
                  color: AppColors.mediumGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
