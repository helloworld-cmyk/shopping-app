import 'package:flutter/material.dart';

import '../../../widgets/product_card.dart';
import '../../../widgets/product_grid.dart';
import '../mock_data.dart';

class WishlistRecommendationsSection extends StatelessWidget {
  const WishlistRecommendationsSection({super.key, required this.products});

  final List<WishlistRecommendationData> products;

  @override
  Widget build(BuildContext context) {
    return ProductGridSection(
      title: 'YOU ALSO VIEWED',
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final WishlistRecommendationData product = products[index];

        return ProductCard(
          image: product.image,
          name: product.name,
          soldLabel: 'Sold (50 Products)',
          priceText: product.price,
          originalPriceText: product.secondaryPrice,
          isAsset: true,
          imageFit: product.imageFit,
          imageAlignment: product.imageAlignment,
        );
      },
    );
  }
}
