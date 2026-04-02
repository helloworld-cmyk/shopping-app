import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/product_card.dart';
import '../../widgets/product_grid.dart';
import 'bloc/bloc.dart';
import 'widget/category_filter_field.dart';
import 'widget/category_selector_bottom_sheet.dart';
import 'widget/men_hero_header.dart';

import 'detail_categories_mock_data.dart';

@RoutePage()
class DetailCatagoriesScreen extends StatelessWidget {
  const DetailCatagoriesScreen({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCategoriesBloc>(
      create: (BuildContext context) =>
          DetailCategoriesBloc(categoryTitle: categoryTitle)
            ..add(DetailCategoriesStarted()),
      child: DetailCategoriesView(categoryTitle: categoryTitle),
    );
  }
}

class DetailCategoriesView extends StatelessWidget {
  const DetailCategoriesView({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            MenHeroHeader(
              onBackTap: () => context.router.maybePop(),
              title: categoryTitle,
              imagePath: resolveHeroImage(categoryTitle),
            ),
            Expanded(
              child: BlocBuilder<DetailCategoriesBloc, DetailCategoriesState>(
                builder: (BuildContext context, DetailCategoriesState state) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(25, 16, 25, 24),
                    child: Column(
                      children: <Widget>[
                        CategoryFilterField(
                          title: state.selectedCategory,
                          isExpanded: state.isCategorySheetOpen,
                          onTap: () =>
                              showCategorySelectorBottomSheet(context, state),
                        ),
                        const SizedBox(height: 16),
                        ProductGridSection(
                          itemCount: state.products.length,
                          gridPadding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            final product = state.products[index];
                            return ProductCard(
                              image: product.imagePath,
                              name: product.name,
                              soldLabel: product.soldLabel,
                              priceText:
                                  '\$ ${product.price.toStringAsFixed(2)}',
                              isAsset: true,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
