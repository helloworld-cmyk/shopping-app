import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/color.dart';

class NotificationTypography {
  static TextStyle get title => GoogleFonts.bebasNeue(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        letterSpacing: 1.2,
      );

  static TextStyle get itemTitle => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        height: 1.5,
      );

  static TextStyle get timestamp => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGray,
      );
}
