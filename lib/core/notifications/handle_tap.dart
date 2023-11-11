
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:upgrade_traine_project/core/navigation/navigation_service.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/video_call_screen.dart';

handleNotificationsTap(NotificationResponse? payload) async {
  print('payload is ${payload?.actionId} ${payload?.id} ${payload?.input}');
  print("id ${payload?.payload}");
  if (payload?.input == 'Accept') {
    print("user clicked on accept button");
    try {
      await NavigationService().navigateTo(VideoCallScreen.routeName,
          arguments: (_getTrainerId(payload)));
      _hideNotification(payload);
    } catch (e) {
      print(e);
    }
  } else {
    _hideNotification(payload);
  }
  // if (payload!.isEmpty || payload == '{}') {
  //   // NavigationService.navigateTo(
  //   //   const NotificationsView(),
  //   // );
  // } else {
  // List<String> str =
  //     payload.replaceAll("{", "").replaceAll("}", "").split(",");

  // Map<String, dynamic> data = {};
  // for (int i = 0; i < str.length; i++) {
  //   List<String> s = str[i].split(":");
  //   data.putIfAbsent(s[0].trim(), () => s[1].trim());
  // }
  // // await AuthRepository(navigatorKey.currentState!.context).hasNewNotifications();
  // String type = data['type'] ?? '';
  // int orderId = int.parse(data['orderId'] ?? '');
  // if (type == '3') {
  //   // NavigationService.navigateTo(OrderDetailsWithShareView(orderId: orderId));
  // } else if (type == '4') {
  //   // NavigationService.navigateTo(OrderDetailsView(orderId: orderId));
  // } else if (type == '7') {
  //   // NavigationService.navigateTo(
  //   //   const NotificationsView(),
  //   // );
  //  }

  // }
}

void _hideNotification(NotificationResponse? payload) {
  FlutterLocalNotificationsPlugin().cancel(payload!.id!);
}

int _getTrainerId(NotificationResponse? payload) {
  return int.parse(payload!.payload!
      .split(',')
      .firstWhere((element) => element.contains('SenderId'))
      .replaceAll("SenderId:", '')
      .trim());
}
