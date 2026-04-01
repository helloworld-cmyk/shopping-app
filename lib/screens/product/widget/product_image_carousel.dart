import 'package:flutter/material.dart';
import '../../../theme/color.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  final VoidCallback onBackTap;

  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.onBackTap,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 375 / 427,
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: widget.onBackTap,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Row(
            children: List.generate(
              widget.images.length,
              (index) => Container(
                margin: const EdgeInsets.only(left: 6),
                width: index == _currentIndex ? 12 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? AppColors.primary
                      : AppColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
