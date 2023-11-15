import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:upgrade_traine_project/core/notifications/show.dart';

void handleOnMessageListener(RemoteMessage event) {
  if (_hasChannelName(event)) {
    _showAgoraNotification(event);
  } else {
    showNotification(false, event, "${event.notification}");
  }
}

void _showAgoraNotification(RemoteMessage event) =>
    showNotification(true, event, "${event.data}");

bool _hasChannelName(RemoteMessage event) => event.data['HiddenData'] != '';
