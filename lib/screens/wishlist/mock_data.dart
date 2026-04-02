import 'package:flutter/material.dart';

class WishlistItemData {
  const WishlistItemData({
    required this.name,
    required this.image,
    required this.price,
  });

  final String name;
  final String image;
  final String price;
}

class WishlistRecommendationData {
  const WishlistRecommendationData({
    required this.name,
    required this.image,
    required this.price,
    this.secondaryPrice,
    this.imageFit = BoxFit.cover,
    this.imageAlignment = Alignment.topCenter,
  });

  final String name;
  final String image;
  final String price;
  final String? secondaryPrice;
  final BoxFit imageFit;
  final Alignment imageAlignment;
}

const List<WishlistItemData> wishlistItems = <WishlistItemData>[
  WishlistItemData(
    name: 'Basic T-shirt',
    image: 'lib/assets/catagories/men/men1.png',
    price: '\$ 49.00',
  ),
  WishlistItemData(
    name: 'Cotton T-shirt',
    image: 'lib/assets/catagories/men/men2.png',
    price: '\$ 69.00',
  ),
  WishlistItemData(
    name: 'Long-sleeved T-shirt',
    image: 'lib/assets/catagories/women/women1.jpg',
    price: '\$ 49.00',
  ),
];

const List<WishlistRecommendationData> wishlistRecommendations =
    <WishlistRecommendationData>[
      WishlistRecommendationData(
        name: 'Cotton T-shirt Text',
        image: 'lib/assets/catagories/men/men4.png',
        price: '\$ 49.00',
      ),
      WishlistRecommendationData(
        name: 'Slit Denim Skirt',
        image: 'lib/assets/catagories/bags/bag1.jpeg',
        price: '\$ 129.00',
        secondaryPrice: '\$ 89.00',
        imageAlignment: Alignment.center,
      ),
      WishlistRecommendationData(
        name: 'Embroidered T-shirt',
        image: 'lib/assets/catagories/kids/kid1.jpeg',
        price: '\$ 39.00',
      ),
      WishlistRecommendationData(
        name: 'Coat With Belt',
        image: 'lib/assets/catagories/women/women4.jpg',
        price: '\$ 49.00',
        secondaryPrice: '\$ 19.00',
      ),
    ];
