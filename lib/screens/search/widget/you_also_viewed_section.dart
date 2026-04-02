import 'package:flutter/material.dart';

import '../../../data/mock_data.dart';
import '../../../widgets/product_card.dart';
import '../../../widgets/product_grid.dart';

class YouAlsoViewedSection extends StatelessWidget {
  const YouAlsoViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductGridSection(
      title: 'YOU ALSO VIEWED',
      itemCount: searchScreenProducts.length,
      itemBuilder: (BuildContext context, int index) {
        final product = searchScreenProducts[index];
        return ProductCard(
          image: product.imagePath,
          name: product.name,
          soldLabel: product.soldLabel,
          priceText:
              product.stringPrice ?? '\$ ${product.price.toStringAsFixed(2)}',
          isAsset: true,
        );
      },
    );
  }
}
