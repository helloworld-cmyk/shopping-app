import '../../models/product_model.dart';

const List<String> menDetailCategories = <String>[
  'All Product',
  'Shirts',
  'Polos',
  'Jeans',
  'Trousers',
  'Jackets',
  'Shoes',
  'Accessories',
];

const List<ProductItem> menDetailCategoryProducts = <ProductItem>[
  ProductItem(
    name: 'Cotton T-shirt',
    soldLabel: 'Sold (50 Products)',
    price: 49,
    imagePath: 'lib/assets/catagories/men/men6.png',
    type: 'Shirts',
  ),
  ProductItem(
    name: 'Cotton T-shirt Text',
    soldLabel: 'Sold (50 Products)',
    price: 49,
    imagePath: 'lib/assets/catagories/men/men1.png',
    type: 'Shirts',
  ),
  ProductItem(
    name: 'Basic T-shirt',
    soldLabel: 'Sold (50 Products)',
    price: 49,
    imagePath: 'lib/assets/catagories/men/men3.png',
    type: 'Jeans',
  ),
  ProductItem(
    name: "Women's Day T-shirt",
    soldLabel: 'Sold (50 Products)',
    price: 59,
    imagePath: 'lib/assets/catagories/men/men2.png',
    type: 'Trousers',
  ),
  ProductItem(
    name: 'Cotton Polo Shirt',
    soldLabel: 'Sold (50 Products)',
    price: 39,
    imagePath: 'lib/assets/catagories/men/men4.png',
    type: 'Polos',
  ),
  ProductItem(
    name: 'Cotton-blend Sweatshirt',
    soldLabel: 'Sold (50 Products)',
    price: 69,
    imagePath: 'lib/assets/catagories/men/men5.png',
    type: 'Jackets',
  ),
];

const List<String> womenDetailCategories = <String>[
  'All Product',
  'Dresses',
  'Shirts',
];

const List<ProductItem> womenDetailCategoryProducts = <ProductItem>[
  ProductItem(
    name: 'Denim Midi Dress',
    soldLabel: 'Sold (32 Products)',
    price: 79,
    imagePath: 'lib/assets/catagories/women/women1.jpg',
    type: 'Dresses',
  ),
  ProductItem(
    name: 'NYC Printed Top',
    soldLabel: 'Sold (27 Products)',
    price: 39,
    imagePath: 'lib/assets/catagories/women/women2.jpg',
    type: 'Dresses',
  ),
  ProductItem(
    name: 'Blue Knit Set',
    soldLabel: 'Sold (24 Products)',
    price: 65,
    imagePath: 'lib/assets/catagories/women/women3.jpeg',
    type: 'Shirts',
  ),
  ProductItem(
    name: 'Minimal Beige Look',
    soldLabel: 'Sold (18 Products)',
    price: 58,
    imagePath: 'lib/assets/catagories/women/women4.jpg',
    type: 'Dresses',
  ),
];

const List<String> kidsDetailCategories = <String>[
  'All Product',
  'Sets',
  'Jackets',
];

const List<ProductItem> kidsDetailCategoryProducts = <ProductItem>[
  ProductItem(
    name: 'Classic Kids Sweater',
    soldLabel: 'Sold (40 Products)',
    price: 45,
    imagePath: 'lib/assets/catagories/kids/kid1.jpeg',
    type: 'Sets',
  ),
  ProductItem(
    name: 'Dino Baby Romper',
    soldLabel: 'Sold (35 Products)',
    price: 35,
    imagePath: 'lib/assets/catagories/kids/kid2.jpeg',
    type: 'Sets',
  ),
  ProductItem(
    name: 'Printed Blue Jacket',
    soldLabel: 'Sold (22 Products)',
    price: 29,
    imagePath: 'lib/assets/catagories/kids/kid3.jpeg',
    type: 'Jackets',
  ),
  ProductItem(
    name: 'Sporty Kid Sneakers',
    soldLabel: 'Sold (28 Products)',
    price: 49,
    imagePath: 'lib/assets/catagories/kids/kid4.jpeg',
    type: 'Jackets',
  ),
];

const List<String> shoesDetailCategories = <String>[
  'All Product',
  'Sneakers',
  'Loafers',
  'Running',
];

const List<ProductItem> shoesDetailCategoryProducts = <ProductItem>[
  ProductItem(
    name: 'Blue Platform Sneaker',
    soldLabel: 'Sold (20 Products)',
    price: 69,
    imagePath: 'lib/assets/catagories/shoes/shoes1.jpeg',
    type: 'Sneakers',
  ),
  ProductItem(
    name: 'Pastel Chunky Sneaker',
    soldLabel: 'Sold (44 Products)',
    price: 79,
    imagePath: 'lib/assets/catagories/shoes/shoes2.jpeg',
    type: 'Sneakers',
  ),
  ProductItem(
    name: 'Leather Loafer',
    soldLabel: 'Sold (31 Products)',
    price: 85,
    imagePath: 'lib/assets/catagories/shoes/shoes3.jpeg',
    type: 'Loafers',
  ),
  ProductItem(
    name: 'Retro Runner',
    soldLabel: 'Sold (26 Products)',
    price: 92,
    imagePath: 'lib/assets/catagories/shoes/shoes4.jpeg',
    type: 'Running',
  ),
];

const List<String> bagsDetailCategories = <String>[
  'All Product',
  'Crossbody',
  'Shoulder Bags',
  'Tote Bags',
];

const List<ProductItem> bagsDetailCategoryProducts = <ProductItem>[
  ProductItem(
    name: 'Taylormade Crossbody',
    soldLabel: 'Sold (38 Products)',
    price: 72,
    imagePath: 'lib/assets/catagories/bags/bag1.jpeg',
    type: 'Crossbody',
  ),
  ProductItem(
    name: 'Monogram Shoulder Bag',
    soldLabel: 'Sold (45 Products)',
    price: 89,
    imagePath: 'lib/assets/catagories/bags/bag2.jpeg',
    type: 'Shoulder Bags',
  ),
  ProductItem(
    name: 'Blue Mini Handbag',
    soldLabel: 'Sold (23 Products)',
    price: 64,
    imagePath: 'lib/assets/catagories/bags/bag3.jpeg',
    type: 'Crossbody',
  ),
  ProductItem(
    name: 'Classic Office Tote',
    soldLabel: 'Sold (33 Products)',
    price: 99,
    imagePath: 'lib/assets/catagories/bags/bag4.jpeg',
    type: 'Tote Bags',
  ),
];

const List<String> accessoriesDetailCategories = <String>[
  'All Product',
  'Necklaces',
  'Rings',
  'Sunglasses',
];

const List<ProductItem> accessoriesDetailCategoryProducts = <ProductItem>[
  ProductItem(
    name: 'Crystal Teddy Necklace',
    soldLabel: 'Sold (51 Products)',
    price: 59,
    imagePath: 'lib/assets/catagories/accessories/accessories1.jpeg',
    type: 'Necklaces',
  ),
  ProductItem(
    name: 'Blue Swan Necklace',
    soldLabel: 'Sold (29 Products)',
    price: 69,
    imagePath: 'lib/assets/catagories/accessories/accessories2.jpeg',
    type: 'Necklaces',
  ),
  ProductItem(
    name: 'Gold Stone Ring',
    soldLabel: 'Sold (47 Products)',
    price: 42,
    imagePath: 'lib/assets/catagories/accessories/accessories3.jpeg',
    type: 'Rings',
  ),
  ProductItem(
    name: 'Aviator Sunglasses',
    soldLabel: 'Sold (36 Products)',
    price: 54,
    imagePath: 'lib/assets/catagories/accessories/accessories4.jpeg',
    type: 'Sunglasses',
  ),
];

// [SOLID - OCP] Sử dụng Config để lúc thêm chỉ cần thêm 1 chỗ
class _DetailCategoryConfig {
  const _DetailCategoryConfig({
    required this.categories,
    required this.products,
    required this.heroImage,
  });

  final List<String> categories;
  final List<ProductItem> products;
  final String heroImage;
}

const Map<String, _DetailCategoryConfig> _detailCategoryConfigs =
    <String, _DetailCategoryConfig>{
      'MEN': _DetailCategoryConfig(
        categories: menDetailCategories,
        products: menDetailCategoryProducts,
        heroImage: 'lib/assets/catagories/men.png',
      ),
      'WOMEN': _DetailCategoryConfig(
        categories: womenDetailCategories,
        products: womenDetailCategoryProducts,
        heroImage: 'lib/assets/catagories/women.png',
      ),
      'KIDS': _DetailCategoryConfig(
        categories: kidsDetailCategories,
        products: kidsDetailCategoryProducts,
        heroImage: 'lib/assets/catagories/kids.png',
      ),
      'SHOES': _DetailCategoryConfig(
        categories: shoesDetailCategories,
        products: shoesDetailCategoryProducts,
        heroImage: 'lib/assets/catagories/shoes.png',
      ),
      'BAGS': _DetailCategoryConfig(
        categories: bagsDetailCategories,
        products: bagsDetailCategoryProducts,
        heroImage: 'lib/assets/catagories/bags.png',
      ),
      'ACCESSORIES': _DetailCategoryConfig(
        categories: accessoriesDetailCategories,
        products: accessoriesDetailCategoryProducts,
        heroImage: 'lib/assets/catagories/accessories.png',
      ),
    };

_DetailCategoryConfig _resolveDetailCategoryConfig(String rawTitle) {
  final normalizedTitle = rawTitle.trim().toUpperCase();
  return _detailCategoryConfigs[normalizedTitle] ??
      _detailCategoryConfigs['MEN']!;
}

List<String> getDetailCategoriesByTitle(String categoryTitle) {
  return _resolveDetailCategoryConfig(categoryTitle).categories;
}

List<ProductItem> getDetailProductsByTitle(String categoryTitle) {
  return _resolveDetailCategoryConfig(categoryTitle).products;
}

String resolveHeroImage(String value) {
  return _resolveDetailCategoryConfig(value).heroImage;
}
