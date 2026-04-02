import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router/app_router.dart';
import '../../../theme/color.dart';
import '../profile_typography.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          _ActionButton(
            icon: Icons.shopping_bag_outlined,
            label: 'My Order',
            onTap: () => context.router.push(const MyOrderRoute()),
          ),
          const SizedBox(height: 12),
          _ActionButton(
            icon: Icons.favorite_border,
            label: 'Wishlist',
            onTap: () => context.router.push(const WishlistRoute()),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: AppColors.black),
            const SizedBox(width: 12),
            Text(label, style: ProfileTypography.actionLabel),
          ],
        ),
      ),
    );
  }
}
