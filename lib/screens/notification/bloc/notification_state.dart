part of 'notification_bloc.dart';

class NotificationState {
  final List<NotificationModel> notifications;
  final bool isSelectionMode;
  final Set<String> selectedIds;
  final bool isLoading;

  NotificationState({
    this.notifications = const [],
    this.isSelectionMode = false,
    this.selectedIds = const {},
    this.isLoading = false,
  });

  NotificationState copyWith({
    List<NotificationModel>? notifications,
    bool? isSelectionMode,
    Set<String>? selectedIds,
    bool? isLoading,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedIds: selectedIds ?? this.selectedIds,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
