import '../cartBloc/cart_item.dart';

sealed class MyOrderEvent {
  const MyOrderEvent();
}

final class PlaceOrder extends MyOrderEvent {
  const PlaceOrder(this.items);

  final List<CartItem> items;
}

final class ClearOrders extends MyOrderEvent {
  const ClearOrders();
}
