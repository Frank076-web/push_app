import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/config/config.dart';

import 'package:push_app/presentation/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationBlocState = context.watch<NotificationsBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Permisos: ${notificationBlocState.status}'),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<NotificationsBloc>().requestPermission(),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: notificationBlocState.notifications.length,
        itemBuilder: (context, index) {
          final notification = notificationBlocState.notifications[index];

          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.body),
            leading: notification.imageUrl != null
                ? Image.network(
                    notification.imageUrl!,
                    fit: BoxFit.cover,
                  )
                : null,
            onTap: () => AppRouter.navigateTo(
                context, '/push-details/${notification.messageId}'),
          );
        },
      ),
    );
  }
}
