import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';
import '../../../widgets/product_card.dart';
import '../../../widgets/product_grid.dart';

class YouAlsoViewedSection extends StatelessWidget {
  const YouAlsoViewedSection({super.key});

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
    return ProductGridSection(
      title: 'YOU ALSO VIEWED',
      sectionPadding: const EdgeInsets.symmetric(horizontal: 25),
      titlePadding: EdgeInsets.zero,
      titleBottomSpacing: 16,
      gridPadding: EdgeInsets.zero,
      accentHeight: 24,
      crossAxisSpacing: 16,
      mainAxisSpacing: 24,
      childAspectRatio: 0.6,
      titleStyle: GoogleFonts.bebasNeue(fontSize: 26, color: AppColors.black),
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
