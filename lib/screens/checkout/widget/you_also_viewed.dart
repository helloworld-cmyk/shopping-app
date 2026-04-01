import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';
import '../../../widgets/product_card.dart';
import '../checkout_mock_data.dart';

class YouAlsoViewedSection extends StatelessWidget {
  final List<RecommendedProductModel> products;

  const YouAlsoViewedSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
          child: Row(
            children: [
              Container(width: 3, height: 20, color: AppColors.primary),
              const SizedBox(width: 10),
              Text(
                'YOU ALSO VIEWED',
                style: GoogleFonts.bebasNeue(
                  fontSize: 22,
                  color: AppColors.black,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
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
          ),
        ),
      ],
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
