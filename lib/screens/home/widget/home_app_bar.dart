import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../theme/color.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 24,
      toolbarHeight: 80,
      title: SvgPicture.asset('lib/assets/icon/Logo.svg', height: 24),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.mediumGray,
                  size: 28,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
