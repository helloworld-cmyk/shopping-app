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

class WishlistState {
  const WishlistState({this.items = _initialWishlistItems});

  final List<WishlistItem> items;

  bool contains(String productId) {
    return items.any((item) => item.id == productId);
  }

  WishlistItem? itemById(String productId) {
    for (final item in items) {
      if (item.id == productId) {
        return item;
      }
    }

    return null;
  }

  WishlistState copyWith({List<WishlistItem>? items}) {
    return WishlistState(items: items ?? this.items);
  }
}

const List<WishlistItem> _initialWishlistItems = <WishlistItem>[
  WishlistItem(
    id: 'basic_tshirt',
    name: 'Basic T-shirt',
    image: 'lib/assets/catagories/men/men1.png',
    price: 49,
  ),
  WishlistItem(
    id: 'cotton_tshirt',
    name: 'Cotton T-shirt',
    image: 'lib/assets/catagories/men/men2.png',
    price: 69,
  ),
  WishlistItem(
    id: 'long_sleeved_tshirt',
    name: 'Long-sleeved T-shirt',
    image: 'lib/assets/catagories/women/women1.jpg',
    price: 49,
  ),
];
