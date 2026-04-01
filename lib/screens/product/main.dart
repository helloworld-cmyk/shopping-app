import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'product_mock_data.dart';
import 'widget/product_image_carousel.dart';
import 'widget/product_info_header.dart';
import 'widget/selection_options.dart';
import 'widget/expandable_description.dart';
import 'widget/reviews_section/reviews_section.dart';
import 'widget/related_products.dart';
import 'widget/sticky_bottom_bar.dart';
import '../../theme/color.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.image, this.title, this.price});

  final String? image;
  final String? title;
  final double? price;

  @override
  Widget build(BuildContext context) {
    final product = mockProductDetail;
    final String displayTitle = title ?? product.name;
    final double displayPrice = price ?? product.price;
    final List<String> displayImages = image == null
        ? product.images
        : <String>[image!, ...product.images.where((item) => item != image)];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageCarousel(
                  images: displayImages,
                  onBackTap: () => context.router.maybePop(),
                ),
                const SizedBox(height: 24),
                ProductInfoHeader(
                  name: displayTitle,
                  rating: product.rating,
                  reviewCount: product.reviewCount,
                  soldLabel: product.soldLabel,
                  description: product.description,
                ),
                const SizedBox(height: 24),
                SelectionOptions(colors: product.colors, sizes: product.sizes),
                const SizedBox(height: 40),
                ExpandableDescription(
                  detailImages: product.detailedDescriptionImages,
                ),
                const SizedBox(height: 48),
                ReviewsSection(reviews: product.reviews),
                const SizedBox(height: 60),
                RelatedProducts(products: product.relatedProducts),
                const SizedBox(height: 120), // Space for sticky bottom bar
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: StickyBottomBar(
              id: displayTitle,
              name: displayTitle,
              image: displayImages.first,
              price: displayPrice,
            ),
          ),
        ],
      ),
    );
  }
}
