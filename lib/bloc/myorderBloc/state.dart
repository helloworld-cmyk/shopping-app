import '../cartBloc/cart_item.dart';

class MyOrderItem {
  const MyOrderItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  final String id;
  final String name;
  final String image;
  final double price;
  final int quantity;

  String get priceLabel => '\$ ${price.toStringAsFixed(2)}';

  factory MyOrderItem.fromCartItem(CartItem item) {
    return MyOrderItem(
      id: item.id,
      name: item.name,
      image: item.image,
      price: item.price,
      quantity: item.quantity,
    );
  }
}

class MyOrderState {
  const MyOrderState({this.items = const <MyOrderItem>[]});

  final List<MyOrderItem> items;

  MyOrderState copyWith({List<MyOrderItem>? items}) {
    return MyOrderState(items: items ?? this.items);
  }
}
