import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/color.dart';

class ProfileTypography {
  static TextStyle headline(double fontSize) => GoogleFonts.bebasNeue(
        fontSize: fontSize,
        color: AppColors.black,
        letterSpacing: 0,
      );

  static TextStyle body(double fontSize, {Color color = AppColors.mediumGray, FontWeight fontWeight = FontWeight.normal, double? height}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
      );

  static TextStyle title = headline(20).copyWith(
    fontWeight: FontWeight.bold,
  );

  static TextStyle name = body(16, fontWeight: FontWeight.w600, color: AppColors.black).copyWith(
    fontSize: 18,
  );

  static TextStyle username = body(12).copyWith(
    color: AppColors.mediumGray,
  );

  static TextStyle actionLabel = body(14).copyWith(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle menuItem = body(14).copyWith(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle signOut = body(14).copyWith(
    color: Colors.red,
    fontWeight: FontWeight.w400,
  );
}
