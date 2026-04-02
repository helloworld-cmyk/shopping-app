import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class MyOrderItemTile extends StatelessWidget {
  const MyOrderItemTile({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  final String name;
  final String image;
  final String price;
  final int quantity;

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
        const SizedBox(width: 18),
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
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        if (quantity > 1)
          Text(
            'x$quantity',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
      ],
    );
  }
}
