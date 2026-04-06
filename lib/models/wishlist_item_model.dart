// [SOLID - SRP] Tách WishlistItem ra file model riêng để State file sạch sẽ hơn
class WishlistItem {
  const WishlistItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  final String id;
  final String name;
  final String image;
  final double price;

  String get priceLabel => '\$ ${price.toStringAsFixed(2)}';

  WishlistItem copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
  }) {
    return WishlistItem(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}
