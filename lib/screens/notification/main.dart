import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'notification_typography.dart';
import 'widget/notification_item.dart';
import 'bloc/notification_bloc.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(LoadNotifications()),
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  CommonAppBar(
                    title: 'NOTIFICATION',
                    onBack: () => context.router.pop(),
                    actions: [
                      if (state.isSelectionMode)
                        IconButton(
                          icon: const Icon(Icons.playlist_add_check, color: AppColors.black),
                          onPressed: () => context.read<NotificationBloc>().add(MarkAllAsRead()),
                        ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz, color: AppColors.black),
                        onPressed: () => context.read<NotificationBloc>().add(ToggleSelectionMode()),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.only(bottom: state.isSelectionMode ? 100 : 20),
                          itemCount: state.notifications.length,
                          itemBuilder: (context, index) {
                            final notification = state.notifications[index];
                            return NotificationItem(
                              notification: notification,
                              isSelectionMode: state.isSelectionMode,
                              isSelected: state.selectedIds.contains(notification.id),
                              onSelectedChanged: (val) {
                                context
                                    .read<NotificationBloc>()
                                    .add(ToggleNotificationSelection(notification.id));
                              },
                            );
                          },
                        ),
                        if (state.isSelectionMode && state.selectedIds.isNotEmpty)
                          Positioned(
                            bottom: 34,
                            left: 24,
                            right: 24,
                            child: ElevatedButton(
                              onPressed: () => context.read<NotificationBloc>().add(MarkSelectedAsRead()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.white,
                                minimumSize: const Size(double.infinity, 56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Mark As Read',
                                style: NotificationTypography.itemTitle.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
