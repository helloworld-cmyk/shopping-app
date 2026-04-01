import 'package:flutter/material.dart';

class ProductDetailModel {
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String soldLabel;
  final String description;
  final List<String> images;
  final List<Color> colors;
  final List<String> sizes;
  final List<String> detailedDescriptionImages;
  final List<Map<String, dynamic>> reviews;
  final List<Map<String, dynamic>> relatedProducts;

  ProductDetailModel({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.soldLabel,
    required this.description,
    required this.images,
    required this.colors,
    required this.sizes,
    required this.detailedDescriptionImages,
    required this.reviews,
    required this.relatedProducts,
  });
}

final ProductDetailModel mockProductDetail = ProductDetailModel(
  name: 'Printed Cotton Shirt',
  price: 45.00,
  rating: 4.9,
  reviewCount: 12,
  soldLabel: 'Sold (50 Products)',
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lectus urna duis convallis convallis tellus.',
  images: [
    'lib/assets/catagories/women.png',
    'lib/assets/catagories/women.png',
    'lib/assets/catagories/women.png',
  ],
  colors: [
    const Color(0xFFE5C8A6),
    const Color(0xFF9E9E9E),
    const Color(0xFF7AA5D2),
  ],
  sizes: ['S', 'M', 'L', 'XL'],
  detailedDescriptionImages: [
    'lib/assets/catagories/women.png',
  ],
  reviews: [
    {
      'userName': 'Theresa Webb',
      'avatar': 'lib/assets/catagories/women.png',
      'rating': 5.0,
      'date': 'May 1, 2022',
      'comment':
          'Cursus sit amet dictum sit amet justo donec enim. Commaodo ullamcorper lacus.',
    },
  ],
  relatedProducts: [
    {
      'name': "Women's Day T-shirt",
      'price': 49.00,
      'imagePath': 'lib/assets/home/arrival2.png',
      'soldLabel': 'Sold (50 Products)',
    },
    {
      'name': 'Long-sleeved T-shirt',
      'price': 49.00,
      'imagePath': 'lib/assets/home/arrival1.png',
      'soldLabel': 'Sold (50 Products)',
    },
    {
      'name': 'Long-sleeved T-shirt',
      'price': 49.00,
      'imagePath': 'lib/assets/home/arrival1.png',
      'soldLabel': 'Sold (50 Products)',
    },
  ],
);
