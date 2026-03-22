import 'package:flutter/material.dart';
import '../../../theme/color.dart';
class OnboardPageData {
  const OnboardPageData({
    required this.assetPath,
    required this.title,
    required this.dotColor,
  });

  final String assetPath;
  final String title;
  final Color dotColor;
}

const onboardPages = <OnboardPageData>[
  OnboardPageData(
    assetPath: 'lib/assets/background/onboard1.png',
    title: 'CLASSY\nFROM HEAD\nTO TOE',
    dotColor: AppColors.primary,
  ),
  OnboardPageData(
    assetPath: 'lib/assets/background/onboard2.png',
    title: 'FLY AWAY\nWITH YOUR\nSTYLE',
    dotColor: AppColors.primary,
  ),
  OnboardPageData(
    assetPath: 'lib/assets/background/onboard3.png',
    title: 'CLOTHES\nFOR A BIG\nPLANET',
    dotColor: AppColors.primary,
  ),
];
