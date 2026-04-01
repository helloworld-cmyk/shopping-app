part of 'notification_bloc.dart';

abstract class NotificationEvent {}

class LoadNotifications extends NotificationEvent {}

class ToggleSelectionMode extends NotificationEvent {}

class ToggleNotificationSelection extends NotificationEvent {
  final String notificationId;
  ToggleNotificationSelection(this.notificationId);
}

class MarkSelectedAsRead extends NotificationEvent {}

class MarkAllAsRead extends NotificationEvent {}
