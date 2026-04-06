import 'package:flutter/material.dart';
import '../../../theme/color.dart';
import '../mock_data.dart';
import '../notification_typography.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final bool isSelectionMode;
  final bool isSelected;
  final ValueChanged<bool?>? onSelectedChanged;

  const NotificationItem({
    super.key,
    required this.notification,
    this.isSelectionMode = false,
    this.isSelected = false,
    this.onSelectedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isSelectionMode)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: isSelected,
                      onChanged: onSelectedChanged,
                      activeColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.extraLightGray),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              _buildIcon(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.content,
                      style: NotificationTypography.itemTitle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.timestamp,
                      style: NotificationTypography.timestamp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Divider(color: AppColors.subtleLine, height: 1, thickness: 1),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    final iconData = notification.type.iconData;
    Color iconColor = AppColors.primary;

    if (!notification.isUnread) {
      iconColor = AppColors.iconMuted;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            shape: BoxShape.circle,
          ),
          child: Center(child: Icon(iconData, color: iconColor, size: 24)),
        ),
        if (notification.isUnread)
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
