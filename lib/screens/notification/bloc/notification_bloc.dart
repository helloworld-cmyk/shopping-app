import 'package:flutter_bloc/flutter_bloc.dart';
import '../mock_data.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<LoadNotifications>((event, emit) {
      emit(state.copyWith(isLoading: true));
      // In a real app, this would be an API call
      emit(state.copyWith(
        notifications: mockNotifications,
        isLoading: false,
      ));
    });

    on<ToggleSelectionMode>((event, emit) {
      emit(state.copyWith(
        isSelectionMode: !state.isSelectionMode,
        selectedIds: {}, // Clear selection when toggling mode
      ));
    });

    on<ToggleNotificationSelection>((event, emit) {
      final newSelectedIds = Set<String>.from(state.selectedIds);
      if (newSelectedIds.contains(event.notificationId)) {
        newSelectedIds.remove(event.notificationId);
      } else {
        newSelectedIds.add(event.notificationId);
      }
      emit(state.copyWith(selectedIds: newSelectedIds));
    });

    on<MarkSelectedAsRead>((event, emit) {
      final updatedNotifications = state.notifications.map((n) {
        if (state.selectedIds.contains(n.id)) {
          return n.copyWith(isUnread: false);
        }
        return n;
      }).toList();

      emit(state.copyWith(
        notifications: updatedNotifications,
        isSelectionMode: false,
        selectedIds: {},
      ));
    });

    on<MarkAllAsRead>((event, emit) {
      final updatedNotifications = state.notifications.map((n) {
        return n.copyWith(isUnread: false);
      }).toList();

      emit(state.copyWith(
        notifications: updatedNotifications,
      ));
    });
  }
}
