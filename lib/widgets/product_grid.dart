import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color.dart';

class ProductSectionTitle extends StatelessWidget {
  const ProductSectionTitle({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.accentWidth = 2,
    this.accentHeight = 30,
    this.titleStyle,
  });

  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;
  final double accentWidth;
  final double accentHeight;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: accentWidth,
                height: accentHeight,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style:
                    titleStyle ??
                    GoogleFonts.bebasNeue(
                      color: AppColors.black,
                      fontSize: 30,
                      letterSpacing: 1.2,
                    ),
              ),
            ],
          ),
          if (trailing != null)
            trailing!
          else if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.mediumGray, width: 1),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  actionText!,
                  textAlign: TextAlign.right,
                  style:
                      GoogleFonts.poppins(
                        color: AppColors.mediumGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: 0,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ProductGridSection extends StatelessWidget {
  const ProductGridSection({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.title,
    this.actionText,
    this.onActionTap,
    this.trailing,
    this.sectionPadding = EdgeInsets.zero,
    this.titlePadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    this.gridPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.titleBottomSpacing = 0,
    this.crossAxisSpacing = 16,
    this.mainAxisSpacing = 16,
    this.childAspectRatio = 0.65,
    this.accentWidth = 2,
    this.accentHeight = 30,
    this.titleStyle,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final String? title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;
  final EdgeInsetsGeometry sectionPadding;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry gridPadding;
  final double titleBottomSpacing;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final double accentWidth;
  final double accentHeight;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sectionPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            ProductSectionTitle(
              title: title!,
              actionText: actionText,
              onActionTap: onActionTap,
              trailing: trailing,
              padding: titlePadding,
              accentWidth: accentWidth,
              accentHeight: accentHeight,
              titleStyle: titleStyle,
            ),
          if (title != null && titleBottomSpacing > 0)
            SizedBox(height: titleBottomSpacing),
          Padding(
            padding: gridPadding,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
