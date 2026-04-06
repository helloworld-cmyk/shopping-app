import '../../models/wishlist_item_model.dart';
import '../../screens/wishlist/wishlist_mock_data.dart';

// [SOLID - SRP] Tách WishlistItem ra file model riêng biệt để state file gọn nhẹ.
class WishlistState {
  const WishlistState({this.items = initialWishlistItemsMockData});

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
