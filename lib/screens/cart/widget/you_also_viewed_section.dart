import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';
import '../../../widgets/product_card.dart';

class YouAlsoViewedSection extends StatelessWidget {
  const YouAlsoViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 2, height: 24, color: AppColors.primary),
              const SizedBox(width: 12),
              Text(
                'YOU ALSO VIEWED',
                style: GoogleFonts.bebasNeue(
                  fontSize: 26,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _YouAlsoViewedProductsGrid(),
        ],
      ),
    );
  }
}

class _YouAlsoViewedProductsGrid extends StatelessWidget {
  const _YouAlsoViewedProductsGrid();

  static const List<Map<String, String>> _products = [
    {
      'name': 'Cotton T-shirt Text',
      'image': 'lib/assets/home/arrival2.png',
      'price': '\$ 49.00',
    },
    {
      'name': 'Slit Denim Skirt',
      'image': 'lib/assets/home/arrival1.png',
      'price': '\$ 129.00',
    },
    {
      'name': 'Embroidered T-shirt',
      'image': 'lib/assets/home/arrival2.png',
      'price': '\$ 39.00',
    },
    {
      'name': 'Coat With Belt',
      'image': 'lib/assets/home/arrival1.png',
      'price': '\$ 49.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final Map<String, String> product = _products[index];
        return ProductCard(
          image: product['image']!,
          name: product['name']!,
          soldLabel: 'Sold (50 Products)',
          priceText: product['price']!,
          isAsset: true,
          soldNameSpacing: 4,
          namePriceSpacing: 4,
        );
      },
    );
  }
}