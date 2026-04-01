part of 'bloc.dart';

class DetailCategoriesState {
  final List<String> categories;
  final List<ProductItem> products;
  final String selectedCategory;
  final bool isCategorySheetOpen;

  DetailCategoriesState({
    required this.categories,
    required this.products,
    required this.selectedCategory,
    required this.isCategorySheetOpen,
  });

  factory DetailCategoriesState.initial({
    required List<String> categories,
    required List<ProductItem> products,
  }) {
    return DetailCategoriesState(
      categories: categories,
      products: products,
      selectedCategory: categories.first,
      isCategorySheetOpen: false,
    );
  }

  DetailCategoriesState copyWith({
    List<String>? categories,
    List<ProductItem>? products,
    String? selectedCategory,
    bool? isCategorySheetOpen,
  }) {
    return DetailCategoriesState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isCategorySheetOpen: isCategorySheetOpen ?? this.isCategorySheetOpen,
    );
  }
}
