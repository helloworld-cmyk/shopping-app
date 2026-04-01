part of 'bloc.dart';

class CartState {
  final List<CartItem> items;

  CartState({
    this.items = const [],
  });

  CartState copyWith({
    List<CartItem>? items,
  }) {
    return CartState(
      items: items ?? this.items,
    );
  }

  double get totalAmount {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get totalQuantity {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
