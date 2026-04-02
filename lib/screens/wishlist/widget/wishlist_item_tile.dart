import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class WishlistItemTile extends StatelessWidget {
  const WishlistItemTile({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    this.onCartTap,
    this.onRemoveTap,
  });

  final String name;
  final String image;
  final String price;
  final VoidCallback? onCartTap;
  final VoidCallback? onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 42,
          height: 52,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const ColoredBox(
                  color: AppColors.background,
                  child: Icon(
                    Icons.image_outlined,
                    size: 18,
                    color: AppColors.lightGray,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _CircleButton(
              diameter: 34,
              backgroundColor: const Color(0xFF1B1B1D),
              borderColor: const Color(0xFF1B1B1D),
              onTap: onCartTap,
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 16,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 10),
            _CircleButton(
              diameter: 32,
              backgroundColor: AppColors.white,
              borderColor: const Color(0xFFD8D8D8),
              onTap: onRemoveTap,
              child: const Icon(
                Icons.close,
                size: 14,
                color: AppColors.mediumGray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.diameter,
    required this.backgroundColor,
    required this.borderColor,
    required this.child,
    this.onTap,
  });

  final double diameter;
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Ink(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(color: borderColor),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
