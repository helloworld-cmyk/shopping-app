import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../theme/color.dart';
import 'widget/home_app_bar.dart';
import 'widget/hero_banner.dart';
import 'widget/category_section.dart';
import 'widget/hot_deal_section.dart';
import 'widget/promotional_banner.dart';
import 'widget/new_arrival_section.dart';
import 'widget/on_sale_section.dart';
import 'widget/custom_bottom_nav.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const HomeAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroBanner(),
            SizedBox(height: 16),
            CategorySection(),
            SizedBox(height: 16),
            HotDealSection(),
            SizedBox(height: 24),
            PromotionalBanner(),
            SizedBox(height: 24),
            NewArrivalSection(),
            SizedBox(height: 24),
            OnSaleSection(),
            SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
