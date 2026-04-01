import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../router/app_router.dart';
import '../../theme/color.dart';
import 'widget/home_app_bar.dart';
import 'widget/hero_banner.dart';
import 'widget/category_section.dart';
import 'widget/hot_deal_section.dart';
import 'widget/promotional_banner.dart';
import 'widget/new_arrival_section.dart';
import 'widget/on_sale_section.dart';
import '../../widgets/custom_bottom_nav.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroBanner(),
            const SizedBox(height: 16),
            CategorySection(
              onViewAllTap: () {
                context.router.push(const CategoriesRoute());
              },
            ),
            const SizedBox(height: 16),
            const HotDealSection(),
            const SizedBox(height: 24),
            const PromotionalBanner(),
            const SizedBox(height: 24),
            const NewArrivalSection(),
            const SizedBox(height: 24),
            const OnSaleSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(selectedIndex: 0),
    );
  }
}
