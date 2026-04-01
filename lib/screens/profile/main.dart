import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../router/app_router.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/profile_header.dart';
import 'widget/quick_actions.dart';
import 'widget/settings_list.dart';
import '../../widgets/custom_bottom_nav.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CommonAppBar(
              title: 'ACCOUNT',
              onBack: () => context.router.navigate(const HomeRoute()),
              actions: [
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColors.primary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeader(),
                    SizedBox(height: 16),
                    QuickActions(),
                    SizedBox(height: 24),
                    SettingsList(),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(selectedIndex: 4),
    );
  }
}
