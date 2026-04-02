import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';
import '../../../widgets/product_card.dart';
import '../../../widgets/product_grid.dart';
import '../checkout_mock_data.dart';

class YouAlsoViewedSection extends StatelessWidget {
  final List<RecommendedProductModel> products;

  const YouAlsoViewedSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ProductGridSection(
      title: 'YOU ALSO VIEWED',
      titlePadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      gridPadding: const EdgeInsets.symmetric(horizontal: 25),
      accentWidth: 3,
      accentHeight: 20,
      crossAxisSpacing: 15,
      mainAxisSpacing: 25,
      childAspectRatio: 0.65,
      titleStyle: GoogleFonts.bebasNeue(
        fontSize: 22,
        color: AppColors.black,
        letterSpacing: 0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          image: products[index].imagePath,
          name: products[index].name,
          soldLabel: products[index].soldLabel,
          isAsset: true,
          imageBorderRadius: 4,
          soldNameSpacing: 4,
          namePriceSpacing: 4,
          soldLabelStyle: GoogleFonts.poppins(
            fontSize: 8,
            color: AppColors.lightGray,
          ),
          nameStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
          priceWidget: _buildPrice(products[index]),
        );
      },
    );
  }

  Widget _buildPrice(RecommendedProductModel product) {
    return Row(
      children: <Widget>[
        if (product.discountedPrice != null) ...<Widget>[
          Text(
            '\$ ${product.price?.toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '- ${product.discountedPrice?.toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ] else
          Text(
            '\$ ${product.price?.toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}
