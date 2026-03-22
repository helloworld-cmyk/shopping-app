import 'package:flutter/material.dart';
import '../../../theme/color.dart';
import 'product_card.dart';
import 'section_title.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image': 'lib/assets/home/onsale1.png',
        'name': 'Ankle Boots',
        'price': '180.00 - 219.00',
        'soldCount': '358',
      },
      {
        'image': 'lib/assets/home/onsale2.png',
        'name': 'Coat With Belt',
        'price': '19.00 - 49.00',
        'soldCount': '358',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
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
        ),
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
                price: products[index]['price']!,
                soldCount: products[index]['soldCount']!,
                isAsset: true,
              );
            },
          ),
        ),
      ],
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
