import '../models/product_model.dart';
import '../screens/detailCatagories/detail_categories_mock_data.dart';

export '../models/product_model.dart';

/// Categories from the Filter design
const List<String> searchFilterCategories = [
  'Shoes',
  'Dresses',
  'Shirts',
  'Polos',
  'Jeans',
  'Blazers',
  'Coats',
  'Trousers',
  'Skirts',
  'Bag',
  'Jacket',
  'Top',
];

/// The Search Screen specific items we saw in the design
const List<ProductItem> searchScreenProducts = [
  ProductItem(
    name: 'Printed Cotton Shirt',
    soldLabel: 'Sold (50 Products)',
    price: 45.00,
    imagePath: 'lib/assets/catagories/women/women1.jpg',
    type: 'Shirts',
  ),
  ProductItem(
    name: 'Cotton T-shirt',
    soldLabel: 'Sold (50 Products)',
    price: 49.00,
    imagePath: 'lib/assets/catagories/men/men6.png',
    type: 'Shirts',
  ),
  ProductItem(
    name: 'Cotton Polo Shirt',
    soldLabel: 'Sold (50 Products)',
    price: 39.00,
    imagePath: 'lib/assets/catagories/men/men4.png',
    type: 'Polos',
  ),
  ProductItem(
    name: 'Ankle Boots',
    soldLabel: 'Sold (50 Products)',
    price: 219.00,
    stringPrice: '\$ 219.00 - 180.00',
    imagePath: 'lib/assets/catagories/shoes/shoes1.jpeg',
    type: 'Shoes',
  ),
  ProductItem(
    name: 'Long-sleeved tT-shirt',
    soldLabel: 'Sold (50 Products)',
    price: 49.00,
    imagePath: 'lib/assets/catagories/women/women2.jpg',
    type: 'Shirts',
  ),
  ProductItem(
    name: 'Embroidered T-shirt',
    soldLabel: 'Sold (50 Products)',
    price: 39.00,
    imagePath: 'lib/assets/catagories/kids/kid1.jpeg',
    type: 'Shirts',
  ),
];

/// Centralized list containing all predefined products
final List<ProductItem> allProducts = [
  ...searchScreenProducts,
  ...menDetailCategoryProducts,
  ...womenDetailCategoryProducts,
  ...kidsDetailCategoryProducts,
  ...shoesDetailCategoryProducts,
  ...bagsDetailCategoryProducts,
  ...accessoriesDetailCategoryProducts,
];
