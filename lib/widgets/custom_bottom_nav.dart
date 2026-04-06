import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../router/app_router.dart';
import '../theme/color.dart';

class BottomNavTabConfig {
  final IconData icon;
  final String label;
  final bool hasAvatarRing;
  final PageRouteInfo<dynamic> route;
  
  const BottomNavTabConfig({
    required this.icon,
    required this.label,
    required this.route,
    this.hasAvatarRing = false,
  });
}

// [SOLID - OCP] Sử dụng List thay vì switch-case để mở rộng Tab dễ dàng mà không cẩn sửa source code UI & route logic.
final List<BottomNavTabConfig> bottomNavTabs = [
  const BottomNavTabConfig(icon: Icons.home_filled, label: 'Home', route: HomeRoute()),
  const BottomNavTabConfig(icon: Icons.favorite, label: 'Wishlist', route: WishlistRoute()),
  const BottomNavTabConfig(icon: Icons.shopping_bag, label: 'Cart', route: CartRoute()),
  const BottomNavTabConfig(icon: Icons.search, label: 'Search', route: SearchRoute()),
  const BottomNavTabConfig(icon: Icons.account_circle, label: 'Account', hasAvatarRing: true, route: ProfileRoute()),
];

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key, this.selectedIndex = 0});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(6, 8, 6, 8 + bottomInset),
      child: Row(
        children: List.generate(bottomNavTabs.length, (index) {
          final tab = bottomNavTabs[index];
          return Expanded(
            child: _BottomNavItem(
              icon: tab.icon,
              label: tab.label,
              isSelected: selectedIndex == index,
              hasAvatarRing: tab.hasAvatarRing,
              onTap: () => _onTabTap(context, index),
            ),
          );
        }),
      ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    if (selectedIndex == index) return;
    context.router.navigate(bottomNavTabs[index].route);
  }
}

class _BottomNavItem extends StatelessWidget {
  static const String _defaultAccountImage = 'lib/assets/home/maskgroup2.png';

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.hasAvatarRing = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final bool hasAvatarRing;

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? AppColors.primary : const Color(0xFF8A8A8A);
    final textColor = const Color(0xFF8A8A8A);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasAvatarRing)
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : const Color(0xFF8A8A8A),
                    width: 1.2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    _defaultAccountImage,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => const Icon(
                      Icons.person,
                      size: 14,
                      color: Color(0xFF6D6D6D),
                    ),
                  ),
                ),
              )
            else
              Icon(icon, size: 22, color: iconColor),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: textColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
