part of 'notifications_bloc.dart';

class NotificationsBlocState extends Equatable {
  final AuthorizationStatus status;

  //TODO: Crear mi modelo de notificaciones
  final List<PushMessage> notifications;

  const NotificationsBlocState({
    this.status = AuthorizationStatus.notDetermined,
    this.notifications = const [],
  });

  NotificationsBlocState copyWith({
    AuthorizationStatus? status,
    List<PushMessage>? notifications,
  }) =>
      NotificationsBlocState(
        status: status ?? this.status,
        notifications: notifications ?? this.notifications,
      );

  @override
  List<Object> get props => [status, notifications];
}
