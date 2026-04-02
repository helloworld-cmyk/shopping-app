import 'package:flutter/material.dart';

import '../../../widgets/product_grid.dart';
import '../../../widgets/product_card.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image': 'lib/assets/home/arrival1.png',
        'name': 'Cotton T-shirt Text',
        'price': '49.00',
        'soldCount': '50',
      },
      {
        'image': 'lib/assets/home/arrival2.png',
        'name': 'Women\'s Day T-shirt',
        'price': '49.00',
        'soldCount': '50',
      },
    ];

    return ProductGridSection(
      title: 'NEW ARRIVAL',
      actionText: 'More Product',
      onActionTap: () {},
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
    );
  }
}
