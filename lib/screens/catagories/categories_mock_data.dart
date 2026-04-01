class CategoryItemData {
  const CategoryItemData({
    required this.title,
    required this.imagePath,
    required this.lineWidth,
  });

  final String title;
  final String imagePath;
  final double lineWidth;
}

const categoriesMockData = <CategoryItemData>[
  CategoryItemData(
    title: 'MEN',
    imagePath: 'lib/assets/catagories/men.png',
    lineWidth: 58,
  ),
  CategoryItemData(
    title: 'WOMEN',
    imagePath: 'lib/assets/catagories/women.png',
    lineWidth: 60,
  ),
  CategoryItemData(
    title: 'KIDS',
    imagePath: 'lib/assets/catagories/kids.png',
    lineWidth: 58,
  ),
  CategoryItemData(
    title: 'BAGS',
    imagePath: 'lib/assets/catagories/bags.png',
    lineWidth: 62,
  ),
  CategoryItemData(
    title: 'SHOES',
    imagePath: 'lib/assets/catagories/shoes.png',
    lineWidth: 76,
  ),
  CategoryItemData(
    title: 'ACCESSORIES',
    imagePath: 'lib/assets/catagories/accessories.png',
    lineWidth: 160,
  ),
];
