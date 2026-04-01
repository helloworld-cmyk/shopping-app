import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/app_router.dart';
import 'categories_mock_data.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/category_card.dart';
import '../../widgets/custom_bottom_nav.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CommonAppBar(
              title: 'Categories',
              onBack: () => context.router.maybePop(),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 24),
                itemCount: categoriesMockData.length,
                separatorBuilder: (_, _) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final item = categoriesMockData[index];

                  return CategoryCard(
                    title: item.title,
                    imagePath: item.imagePath,
                    bottomLineWidth: item.lineWidth,
                    onTap: () => context.router.push(
                      DetailCatagoriesRoute(categoryTitle: item.title),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(selectedIndex: 1),
    );
  }
}
