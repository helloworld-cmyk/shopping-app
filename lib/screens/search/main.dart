import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color.dart';
import 'widget/filter_chips_section.dart';
import 'widget/you_also_viewed_section.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.router.pop(),
                      child: const Icon(Icons.arrow_back_ios_new, color: AppColors.black, size: 20),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Product...',
                            hintStyle: GoogleFonts.poppins(
                              color: AppColors.lightGray,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                            isDense: true,
                          ),
                          style: GoogleFonts.poppins(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        // Filter tap action placeholder
                      },
                      child: const Icon(Icons.tune, color: AppColors.mediumGray, size: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const FilterChipsSection(),
              const SizedBox(height: 32),
              const YouAlsoViewedSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
