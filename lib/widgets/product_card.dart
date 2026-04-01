import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../router/app_router.dart';
import '../theme/color.dart';
import 'utils/price_utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.soldLabel,
    this.priceText,
    this.originalPriceText,
    this.priceWidget,
    this.isAsset = false,
    this.imageAspectRatio = 157 / 172,
    this.imageBackgroundColor = AppColors.background,
    this.imageBorderRadius = 0,
    this.imageSoldSpacing = 12,
    this.soldNameSpacing = 6,
    this.namePriceSpacing = 8,
    this.nameMaxLines = 1,
    this.imageFit = BoxFit.cover,
    this.imageAlignment = Alignment.topCenter,
    this.soldLabelStyle,
    this.nameStyle,
    this.priceStyle,
    this.originalPriceStyle,
    this.onTap,
  });

  final String image;
  final String name;
  final String soldLabel;
  final String? priceText;
  final String? originalPriceText;
  final Widget? priceWidget;
  final bool isAsset;
  final double imageAspectRatio;
  final Color imageBackgroundColor;
  final double imageBorderRadius;
  final double imageSoldSpacing;
  final double soldNameSpacing;
  final double namePriceSpacing;
  final int nameMaxLines;
  final BoxFit imageFit;
  final Alignment imageAlignment;
  final TextStyle? soldLabelStyle;
  final TextStyle? nameStyle;
  final TextStyle? priceStyle;
  final TextStyle? originalPriceStyle;
  final VoidCallback? onTap;

  void _handleTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }

    context.router.push(
      ProductRoute(
        image: image,
        title: name,
        price: parsePriceTextToDouble(priceText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget imageWidget = isAsset
        ? Image.asset(
            image,
            fit: imageFit,
            alignment: imageAlignment,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_outlined, color: AppColors.lightGray),
          )
        : Image.network(
            image,
            fit: imageFit,
            alignment: imageAlignment,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_outlined, color: AppColors.lightGray),
          );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _handleTap(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: imageAspectRatio,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: imageBackgroundColor,
                  borderRadius: BorderRadius.circular(imageBorderRadius),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(imageBorderRadius),
                  child: imageWidget,
                ),
              ),
            ),
            SizedBox(height: imageSoldSpacing),
            Text(
              soldLabel,
              style:
                  soldLabelStyle ??
                  GoogleFonts.poppins(
                    color: AppColors.mediumGray,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: 0,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: soldNameSpacing),
            Text(
              name,
              style:
                  nameStyle ??
                  GoogleFonts.poppins(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: 0,
                  ),
              maxLines: nameMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
            if (priceWidget != null ||
                (priceText?.isNotEmpty ?? false)) ...<Widget>[
              SizedBox(height: namePriceSpacing),
              priceWidget ??
                  Row(
                    children: <Widget>[
                      Text(
                        priceText ?? '',
                        style:
                            priceStyle ??
                            GoogleFonts.poppins(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0,
                            ),
                      ),
                      if (originalPriceText?.isNotEmpty ?? false) ...<Widget>[
                        const SizedBox(width: 8),
                        Text(
                          originalPriceText!,
                          style:
                              originalPriceStyle ??
                              GoogleFonts.poppins(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                                height: 1,
                                letterSpacing: 0,
                              ),
                        ),
                      ],
                    ],
                  ),
            ],
          ],
        ),
      ),
    );
  }
}
