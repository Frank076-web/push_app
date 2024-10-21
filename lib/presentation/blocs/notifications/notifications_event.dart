part of 'notifications_bloc.dart';

sealed class NotificationsEvent {}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  NotificationStatusChanged(this.status);
}

// TODO2: NotificationRecieved # PushMessage

class NotificationRecieved extends NotificationsEvent {
  final PushMessage message;
  NotificationRecieved(this.message);
}
