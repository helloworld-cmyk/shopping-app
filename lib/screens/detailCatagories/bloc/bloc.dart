import 'package:flutter_bloc/flutter_bloc.dart';

import '../detail_categories_mock_data.dart';
import '../../../models/product_model.dart';

part 'event.dart';
part 'state.dart';

class DetailCategoriesBloc
    extends Bloc<DetailCategoriesEvent, DetailCategoriesState> {
  DetailCategoriesBloc({required String categoryTitle})
      : _allProducts = getDetailProductsByTitle(categoryTitle),
        super(
          DetailCategoriesState.initial(
            categories: getDetailCategoriesByTitle(categoryTitle),
            products: getDetailProductsByTitle(categoryTitle),
          ),
        ) {
    on<DetailCategoriesStarted>(_onStarted);
    on<DetailCategoriesCategoryChanged>(_onCategoryChanged);
    on<DetailCategoriesSheetToggled>(_onSheetToggled);
  }

  final List<ProductItem> _allProducts;

  void _onStarted(
    DetailCategoriesStarted event,
    Emitter<DetailCategoriesState> emit,
  ) {
  
    _filterProducts(state.selectedCategory, emit);
  }

  void _onCategoryChanged(
    DetailCategoriesCategoryChanged event,
    Emitter<DetailCategoriesState> emit,
  ) {
    if (event.category == state.selectedCategory) return;
    _filterProducts(event.category, emit);
  }

  void _onSheetToggled(
    DetailCategoriesSheetToggled event,
    Emitter<DetailCategoriesState> emit,
  ) {
    emit(state.copyWith(isCategorySheetOpen: event.isOpen));
  }

  void _filterProducts(String category, Emitter<DetailCategoriesState> emit) {
    List<ProductItem> filteredProducts;
    if (category == 'All Product') {
      filteredProducts = _allProducts;
    } else {
      filteredProducts = _allProducts
          .where((product) => product.type == category)
          .toList();
    }

    emit(state.copyWith(
      selectedCategory: category,
      products: filteredProducts,
      isCategorySheetOpen: false,
    ));
  }
}
