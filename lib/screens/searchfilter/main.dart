import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../theme/color.dart';
import 'searchfilter_mock_data.dart';
import 'widget/filter_apply_button.dart';
import 'widget/filter_category_section.dart';
import 'widget/filter_color_section.dart';
import 'widget/filter_header.dart';
import 'widget/filter_price_section.dart';
import 'widget/filter_size_section.dart';

@RoutePage()
class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  late String _expandedTitle;
  late String _selectedCategoryItem;
  late Color _selectedColor;
  late String _selectedSize;
  RangeValues _priceValues = const RangeValues(
    searchFilterMinPrice,
    searchFilterMaxPrice,
  );

  @override
  void initState() {
    super.initState();
    _expandedTitle = searchFilterCategoryGroups.first.title;
    _selectedCategoryItem = searchFilterCategoryGroups.first.items.first;
    _selectedColor = searchFilterColors.first;
    _selectedSize = searchFilterSizes.first;
  }

  void _onApply() {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, topInset + 16, 24, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterHeader(onClose: () => context.router.maybePop()),
              const SizedBox(height: 28),
              FilterCategorySection(
                groups: searchFilterCategoryGroups,
                expandedTitle: _expandedTitle,
                selectedItem: _selectedCategoryItem,
                onGroupTap: (title) {
                  setState(() {
                    _expandedTitle = title;
                    final group = searchFilterCategoryGroups.firstWhere(
                      (element) => element.title == title,
                    );
                    _selectedCategoryItem = group.items.first;
                  });
                },
                onItemTap: (item) {
                  setState(() {
                    _selectedCategoryItem = item;
                  });
                },
              ),
              const SizedBox(height: 24),
              FilterColorSection(
                colors: searchFilterColors,
                selectedColor: _selectedColor,
                onColorSelected: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              ),
              const SizedBox(height: 34),
              FilterSizeSection(
                sizes: searchFilterSizes,
                selectedSize: _selectedSize,
                onSizeSelected: (size) {
                  setState(() {
                    _selectedSize = size;
                  });
                },
              ),
              const SizedBox(height: 34),
              FilterPriceSection(
                values: _priceValues,
                min: searchFilterMinPrice,
                max: searchFilterMaxPrice,
                onChanged: (values) {
                  setState(() {
                    _priceValues = values;
                  });
                },
              ),
              const SizedBox(height: 42),
              FilterApplyButton(onPressed: _onApply),
            ],
          ),
        ),
      ),
    );
  }
}
