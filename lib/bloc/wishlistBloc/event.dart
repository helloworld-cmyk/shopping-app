import '../../models/wishlist_item_model.dart';

sealed class WishlistEvent {
  const WishlistEvent();
}

final class AddWishlistItem extends WishlistEvent {
  const AddWishlistItem(this.item);

  final WishlistItem item;
}

final class RemoveWishlistItem extends WishlistEvent {
  const RemoveWishlistItem(this.productId);

  final String productId;
}

final class ToggleWishlistItem extends WishlistEvent {
  const ToggleWishlistItem(this.item);

  final WishlistItem item;
}
