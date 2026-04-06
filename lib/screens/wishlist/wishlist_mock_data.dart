import '../../models/wishlist_item_model.dart';

// [SOLID - SRP] Tách Mock Data ra file riêng
const List<WishlistItem> initialWishlistItemsMockData = <WishlistItem>[
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
