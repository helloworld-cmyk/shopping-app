import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/mock_data.dart';
import '../../../widgets/product_card.dart';
import '../../../theme/color.dart';

class YouAlsoViewedSection extends StatelessWidget {
  const YouAlsoViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 2,
                height: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'YOU ALSO VIEWED',
                style: GoogleFonts.bebasNeue(
                  fontSize: 24,
                  color: AppColors.black,
                  letterSpacing: 0.5,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            childAspectRatio: 0.55,
          ),
          itemCount: searchScreenProducts.length,
          itemBuilder: (BuildContext context, int index) {
            final product = searchScreenProducts[index];
            return ProductCard(
              image: product.imagePath,
              name: product.name,
              soldLabel: product.soldLabel,
              priceText: product.stringPrice ?? '\$ ${product.price.toStringAsFixed(2)}',
              isAsset: true,
            );
          },
        ),
      ],
    );
  }
}
