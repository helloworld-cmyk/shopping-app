import 'package:flutter/material.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image': 'lib/assets/home/arrival1.png',
        'name': 'Cotton T-shirt Text',
        'price': '49.00',
        'soldCount': '50'
      },
      {
        'image': 'lib/assets/home/arrival2.png',
        'name': 'Women\'s Day T-shirt',
        'price': '49.00',
        'soldCount': '50'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: 'NEW ARRIVAL',
          actionText: 'More Product',
          onActionTap: () {},
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
}
