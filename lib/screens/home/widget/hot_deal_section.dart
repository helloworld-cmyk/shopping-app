import 'package:flutter/material.dart';

import '../../../widgets/product_card.dart';
import 'section_title.dart';

class HotDealSection extends StatelessWidget {
  const HotDealSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image': 'lib/assets/home/hotdeal1.png',
        'name': 'Long-Sleeved T-shirt',
        'price': '49.00',
        'soldCount': '358',
      },
      {
        'image': 'lib/assets/home/hotdeal2.png',
        'name': 'Printed Cotton Shirt',
        'price': '45.00',
        'soldCount': '358',
      },
      {
        'image': 'lib/assets/home/hotdeal3.png',
        'name': 'Cotton T-shirt',
        'price': '49.00',
        'soldCount': '358',
      },
      {
        'image': 'lib/assets/home/hotdeal4.png',
        'name': 'Embroidered T-shirt',
        'price': '39.00',
        'soldCount': '358',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'HOT DEAL'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                image: products[index]['image']!,
                name: products[index]['name']!,
                soldLabel: 'Sold (${products[index]['soldCount']} Products)',
                priceText: '\$ ${products[index]['price']!}',
                isAsset: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
