import 'package:flutter/material.dart';

import '../../../theme/color.dart';
import '../../../widgets/product_grid.dart';
import '../../../widgets/product_card.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image': 'lib/assets/home/onsale1.png',
        'name': 'Ankle Boots',
        'price': '180.00',
        'soldCount': '358',
      },
      {
        'image': 'lib/assets/home/onsale2.png',
        'name': 'Coat With Belt',
        'price': '19.00',
        'soldCount': '358',
      },
    ];

    return ProductGridSection(
      title: 'ON SALE',
      trailing: Row(
        children: [
          _buildTimeBox(context, '09'),
          const Text(' : '),
          _buildTimeBox(context, '34'),
          const Text(' : '),
          _buildTimeBox(context, '25'),
        ],
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
    );
  }

  Widget _buildTimeBox(BuildContext context, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(time, style: TextStyle(color: AppColors.white)),
    );
  }
}
