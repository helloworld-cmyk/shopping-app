import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/authBloc/bloc.dart';
import '../../../bloc/authBloc/event.dart';
import '../../../theme/color.dart';
import '../profile_typography.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SettingItem(
          icon: Icons.person_outline,
          label: 'Account Setting',
          onTap: () {},
        ),
        _SettingItem(
          icon: Icons.notifications_none,
          label: 'Notification',
          onTap: () {},
        ),
        _SettingItem(
          icon: Icons.payment_outlined,
          label: 'Payment Infomation',
          onTap: () {},
        ),
        _SettingItem(
          icon: Icons.lock_outline,
          label: 'Privacy Setting',
          onTap: () {},
        ),
        _SettingItem(
          icon: Icons.settings_outlined,
          label: 'General Setting',
          onTap: () {},
        ),
        _SettingItem(
          icon: Icons.language_outlined,
          label: 'Language',
          onTap: () {},
        ),
        _SettingItem(
          icon: Icons.group_outlined,
          label: 'Change Account',
          onTap: () {},
        ),
        _SettingItem(
          icon: Icons.logout,
          label: 'Sign Out',
          labelColor: Colors.red,
          showArrow: false,
          onTap: () {
            context.read<AuthBloc>().add(const AuthSignedOut());
          },
        ),
      ],
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? labelColor;
  final bool showArrow;
  final VoidCallback onTap;

  const _SettingItem({
    required this.icon,
    required this.label,
    this.labelColor,
    this.showArrow = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: labelColor ?? AppColors.black, size: 22),
      title: Text(
        label,
        style: labelColor != null
            ? ProfileTypography.signOut
            : ProfileTypography.menuItem,
      ),
      trailing: showArrow
          ? const Icon(Icons.chevron_right, size: 20, color: AppColors.black)
          : null,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
    );
  }
}
