import 'package:flutter/material.dart';

import '../../../widgets/product_card.dart';

// imported from models
import '../../../models/product_model.dart';
class ProductGridSection extends StatelessWidget {
  const ProductGridSection({super.key, required this.products});

  final List<ProductItem> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (BuildContext context, int index) {
        final ProductItem product = products[index];
        return ProductCard(
          image: product.imagePath,
          name: product.name,
          soldLabel: product.soldLabel,
          priceText: '\$ ${product.price.toStringAsFixed(2)}',
          isAsset: true,
        );
      },
    );
  }
}
