import 'package:flutter/material.dart';

class SearchFilterCategoryGroup {
  const SearchFilterCategoryGroup({required this.title, required this.items});

  final String title;
  final List<String> items;
}

const List<SearchFilterCategoryGroup> searchFilterCategoryGroups = [
  SearchFilterCategoryGroup(
    title: 'Men',
    items: [
      'Shirts',
      'Polos',
      'Jeans',
      'Trousers',
      'Jackets',
      'Shoes',
      'Accessories',
    ],
  ),
  SearchFilterCategoryGroup(
    title: 'Women',
    items: ['Dresses', 'Tops', 'Skirts', 'Shoes'],
  ),
  SearchFilterCategoryGroup(
    title: 'Kids',
    items: ['T-Shirts', 'Shorts', 'Sneakers'],
  ),
];

const List<Color> searchFilterColors = [
  Color(0xFFE8C89E),
  Color(0xFF9B9B9B),
  Color(0xFF79A8E4),
  Color(0xFFE4B2B5),
  Color(0xFFA8C0B6),
  Color(0xFFF5DE4F),
];

const List<String> searchFilterSizes = ['S', 'M', 'L', 'XL'];

const double searchFilterMinPrice = 0;
const double searchFilterMaxPrice = 39;
