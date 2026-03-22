import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String originalPrice;
  final String soldCount;
  final bool isAsset;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.originalPrice = '',
    required this.soldCount,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 157 / 172,
          child: Container(
            color: AppColors.background,
            child: isAsset
                ? Image.asset(
                    image,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )
                : Image.network(
                    image,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Sold ($soldCount Products)',
          style: GoogleFonts.poppins(
            color: AppColors.mediumGray,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: GoogleFonts.poppins(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1,
            letterSpacing: 0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '\$ $price',
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1,
                letterSpacing: 0,
              ),
            ),
            if (originalPrice.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                '- \$$originalPrice',
                style: TextStyle(
                  color: AppColors.primary,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
