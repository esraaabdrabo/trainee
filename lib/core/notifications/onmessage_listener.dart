import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:upgrade_traine_project/core/datasources/shared_preference.dart';
import 'package:upgrade_traine_project/core/notifications/show.dart';
import 'package:upgrade_traine_project/core/ui/error_ui/toast.dart';

void handleOnMessageListener(RemoteMessage event) async {
  if (_hasChannelName(event)) {
    //this is notification from agora
    //voice call or video call
    _showAgoraNotification(event);
  } else {
    try {
      showNotification(false, event, "${event.notification}");
    } catch (e) {
      Toast.show(e.toString());
    }
    bool? isNotificationsEnabled =
        (await SpUtil.instance).getBool("is_notifications_enabled");

    if (isNotificationsEnabled == null || isNotificationsEnabled) {}
  }
}

void _showAgoraNotification(RemoteMessage event) =>
    showNotification(true, event, "${event.data}");

bool _hasChannelName(RemoteMessage event) => event.data['HiddenData'] != '';
