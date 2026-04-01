
enum NotificationType { order, shipping, discount }

class NotificationModel {
  final String id;
  final String content;
  final String timestamp;
  final NotificationType type;
  final bool isUnread;

  NotificationModel({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.type,
    this.isUnread = false,
  });

  NotificationModel copyWith({
    String? id,
    String? content,
    String? timestamp,
    NotificationType? type,
    bool? isUnread,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      isUnread: isUnread ?? this.isUnread,
    );
  }
}

final List<NotificationModel> mockNotifications = [
  NotificationModel(
    id: '1',
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    timestamp: '2 Day Ago',
    type: NotificationType.order,
    isUnread: true,
  ),
  NotificationModel(
    id: '2',
    content: 'Porttitor rhoncus dolor purus non enim. Scelerisque eleifend donec pretium',
    timestamp: '3 Day Ago',
    type: NotificationType.shipping,
    isUnread: true,
  ),
  NotificationModel(
    id: '3',
    content: 'Vivamus at augue eget arcu dictum varius duis. Sapien faucibus et molestie',
    timestamp: '4 Day Ago',
    type: NotificationType.discount,
    isUnread: true,
  ),
  NotificationModel(
    id: '4',
    content: 'Blandit aliquam etiam erat velit. Id porta nibh venenatis cras sed.',
    timestamp: '5 Day Ago',
    type: NotificationType.shipping,
    isUnread: true,
  ),
  NotificationModel(
    id: '5',
    content: 'In dictum non consectetur a erat nam at lectus. Vel eros donec ac',
    timestamp: '5 Day Ago',
    type: NotificationType.shipping,
    isUnread: true,
  ),
  NotificationModel(
    id: '6',
    content: 'Amet risus nullam eget felis eget nunc lobortis mattis aliquam. Purus sit amet',
    timestamp: '9 Day Ago',
    type: NotificationType.discount,
    isUnread: true,
  ),
  NotificationModel(
    id: '7',
    content: 'Justo nec ultrices dui sapien eget. Volutpat lacus laoreet non curabitur gravida',
    timestamp: '12 Day Ago',
    type: NotificationType.order,
    isUnread: false,
  ),
];
