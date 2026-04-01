import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';
import '../../../widgets/product_card.dart';

class RelatedProducts extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const RelatedProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Container(width: 2, height: 24, color: AppColors.primary),
              const SizedBox(width: 12),
              Text(
                'RELATED PRODUCT',
                style: GoogleFonts.bebasNeue(
                  fontSize: 26,
                  color: AppColors.black,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 280,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 25.0),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> product = products[index];
              return SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ProductCard(
                    image: product['imagePath'] as String,
                    name: product['name'] as String,
                    soldLabel: product['soldLabel'] as String,
                    priceText:
                        '\$ ${(product['price'] as num).toStringAsFixed(2)}',
                    isAsset: true,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
