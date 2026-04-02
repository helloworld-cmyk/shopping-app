import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(const WishlistState()) {
    on<AddWishlistItem>(_onAddWishlistItem);
    on<RemoveWishlistItem>(_onRemoveWishlistItem);
    on<ToggleWishlistItem>(_onToggleWishlistItem);
  }

  void _onAddWishlistItem(AddWishlistItem event, Emitter<WishlistState> emit) {
    if (state.contains(event.item.id)) {
      return;
    }

    emit(state.copyWith(items: <WishlistItem>[event.item, ...state.items]));
  }

  void _onRemoveWishlistItem(
    RemoveWishlistItem event,
    Emitter<WishlistState> emit,
  ) {
    emit(
      state.copyWith(
        items: state.items.where((item) => item.id != event.productId).toList(),
      ),
    );
  }

  void _onToggleWishlistItem(
    ToggleWishlistItem event,
    Emitter<WishlistState> emit,
  ) {
    if (state.contains(event.item.id)) {
      emit(
        state.copyWith(
          items: state.items.where((item) => item.id != event.item.id).toList(),
        ),
      );
      return;
    }

    emit(state.copyWith(items: <WishlistItem>[event.item, ...state.items]));
  }
}
