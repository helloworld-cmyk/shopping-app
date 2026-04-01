class ProductItem {
  const ProductItem({
    required this.name,
    required this.soldLabel,
    required this.price,
    required this.imagePath,
    required this.type,
    this.stringPrice,
  });

  final String name;
  final String soldLabel;
  final double price;
  final String imagePath;
  final String type;
  /// Optional formatted string price (e.g., "$ 219.00 - 180.00")
  final String? stringPrice;
}
