class CartItemModel {
  final String name;
  final double price;
  final String imagePath;
  int quantity;

  CartItemModel({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });
}

class RecommendedProductModel {
  final String name;
  final double? price;
  final double? discountedPrice;
  final String imagePath;
  final String soldLabel;

  RecommendedProductModel({
    required this.name,
    this.price,
    this.discountedPrice,
    required this.imagePath,
    required this.soldLabel,
  });
}

final List<CartItemModel> mockCartItems = [
  CartItemModel(
    name: 'Basic T-shirt',
    price: 49.00,
    imagePath: 'lib/assets/home/arrival1.png',
    quantity: 2,
  ),
  CartItemModel(
    name: 'Cotton T-shirt',
    price: 69.00,
    imagePath: 'lib/assets/home/arrival2.png',
    quantity: 1,
  ),
  CartItemModel(
    name: 'Long-sleeved T-shirt',
    price: 49.00,
    imagePath: 'lib/assets/home/arrival1.png',
    quantity: 2,
  ),
];

final List<RecommendedProductModel> mockRecommendedProducts = [
  RecommendedProductModel(
    name: 'Cotton T-shirt Text',
    price: 49.00,
    imagePath: 'lib/assets/home/arrival2.png',
    soldLabel: 'Sold (50 Products)',
  ),
  RecommendedProductModel(
    name: 'Slit Denim Skirt',
    price: 129.00,
    discountedPrice: 89.00,
    imagePath: 'lib/assets/home/arrival1.png',
    soldLabel: 'Sold (50 Products)',
  ),
  RecommendedProductModel(
    name: 'Embroidered T-shirt',
    price: 39.00,
    imagePath: 'lib/assets/home/arrival2.png',
    soldLabel: 'Sold (50 Products)',
  ),
  RecommendedProductModel(
    name: 'Coat With Belt',
    price: 49.00,
    discountedPrice: 19.00,
    imagePath: 'lib/assets/home/arrival1.png',
    soldLabel: 'Sold (50 Products)',
  ),
];
