import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc() : super(const MyOrderState()) {
    on<PlaceOrder>(_onPlaceOrder);
    on<ClearOrders>(_onClearOrders);
  }

  void _onPlaceOrder(PlaceOrder event, Emitter<MyOrderState> emit) {
    if (event.items.isEmpty) {
      return;
    }

    final List<MyOrderItem> placedItems = event.items
        .map(MyOrderItem.fromCartItem)
        .toList();

    emit(state.copyWith(items: <MyOrderItem>[...placedItems, ...state.items]));
  }

  void _onClearOrders(ClearOrders event, Emitter<MyOrderState> emit) {
    emit(const MyOrderState());
  }
}
