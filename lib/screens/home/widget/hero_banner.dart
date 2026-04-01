import 'package:flutter/material.dart';
import '../../../theme/color.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Image.asset(
          'lib/assets/home/1stslider.png',
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        // Overlay Gradients/Shadow for text readability
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.1),
                Colors.black.withValues(alpha: 0.5),
              ],
            ),
          ),
        ),
        // Text Content
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MERGING STYLE WITH',
                style: GoogleFonts.bebasNeue(
                  color: AppColors.white,
                  letterSpacing: 1.5,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ELEGANCE',
                    style: GoogleFonts.bebasNeue(
                      color: AppColors.primary,
                      letterSpacing: 2,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Page Indicators
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: index == 0
                      ? AppColors.primary
                      : AppColors.white.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
