import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;

  const SectionTitle({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 2,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.bebasNeue(
                  color: AppColors.black,
                  fontSize: 30,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          if (trailing != null)
            trailing!
          else if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.mediumGray,
                      width: 1,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  actionText!,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                    color: AppColors.mediumGray,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
