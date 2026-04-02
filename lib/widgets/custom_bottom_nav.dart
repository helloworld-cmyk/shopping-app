import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../router/app_router.dart';
import '../theme/color.dart';

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
        children: [
          Expanded(
            child: _BottomNavItem(
              icon: Icons.home_filled,
              label: 'Home',
              isSelected: selectedIndex == 0,
              onTap: () => _onTabTap(context, 0),
            ),
          ),
          Expanded(
            child: _BottomNavItem(
              icon: Icons.favorite,
              label: 'Wishlist',
              isSelected: selectedIndex == 1,
              onTap: () => _onTabTap(context, 1),
            ),
          ),
          Expanded(
            child: _BottomNavItem(
              icon: Icons.shopping_bag,
              label: 'Cart',
              isSelected: selectedIndex == 2,
              onTap: () => _onTabTap(context, 2),
            ),
          ),
          Expanded(
            child: _BottomNavItem(
              icon: Icons.search,
              label: 'Search',
              isSelected: selectedIndex == 3,
              onTap: () => _onTabTap(context, 3),
            ),
          ),
          Expanded(
            child: _BottomNavItem(
              icon: Icons.account_circle,
              label: 'Account',
              isSelected: selectedIndex == 4,
              hasAvatarRing: true,
              onTap: () => _onTabTap(context, 4),
            ),
          ),
        ],
      ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    if (selectedIndex == index) return;

    final PageRouteInfo<dynamic> route;
    switch (index) {
      case 0:
        route = const HomeRoute();
        break;
      case 1:
        route = const WishlistRoute();
        break;
      case 2:
        route = const CartRoute();
        break;
      case 3:
        route = const SearchRoute();
        break;
      case 4:
        route = const ProfileRoute();
        break;
      default:
        return;
    }
    context.router.navigate(route);
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
