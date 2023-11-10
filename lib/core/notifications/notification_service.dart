import "dart:developer";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import 'package:flutter/material.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:upgrade_traine_project/features/notification/presentation/view/notification_screen.dart";

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> backgroundHandler(RemoteMessage message) async {
  Navigator.of(navigatorKey.currentState!.context).push(
    MaterialPageRoute(
      builder: (context) => const NotificationScreen(),
    ),
  );
  // if (int.parse(message.data["type"]) == -1) {
  //   navigatorKey.currentState!.context.read<AuthCubit>().onUpdateAuth(false);
  //   navigatorKey.currentState!.context.read<UserCubit>().onUpdateUserData(UserModel());
  //   Utils.clearSavedData();
  //   GlobalState.instance.set("token", "");
  //   navigatorKey.currentState!.pushNamed(Routes.loginRoute);
  // }else if (int.parse(message.data["type"]) == 10){
  //   UserModel user = navigatorKey.currentState!.context.read<UserCubit>().state.model;
  //   user.isApproved = true;
  //   navigatorKey.currentState!.context.read<UserCubit>().onUpdateUserData(user);
  // }
  await Firebase.initializeApp();
}

void requestPermissions() {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
}

void showNotification(RemoteMessage event, String payload) async {
  var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "com.yacotch.partner", "yacotch",
      channelDescription: "notificationBase",
      enableVibration: true,
      playSound: true,
      icon: '@mipmap/ic_launcher',
      importance: Importance.high,
      priority: Priority.high);
  var notificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );
  String title = "${event.notification!.title}";
  String body = "${event.notification!.body}";
  await flutterLocalNotificationsPlugin
      .show(200, title, body, notificationDetails, payload: payload);
}

void initLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) =>
          handleNotificationsTap(payload));
}

Future<void> registerNotification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  firebaseMessaging.setAutoInitEnabled(false);
  await firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

void initializeFlutterFire() async => await registerNotification();

handleNotificationsTap(String? payload) async {
  log('payload is $payload');

  if (payload!.isEmpty || payload == '{}') {
    // NavigationService.navigateTo(
    //   const NotificationsView(),
    // );
  } else {
    List<String> str =
        payload.replaceAll("{", "").replaceAll("}", "").split(",");
    Map<String, dynamic> data = {};
    for (int i = 0; i < str.length; i++) {
      List<String> s = str[i].split(":");
      data.putIfAbsent(s[0].trim(), () => s[1].trim());
    }
    // await AuthRepository(navigatorKey.currentState!.context).hasNewNotifications();
    String type = data['type'] ?? '';
    int orderId = int.parse(data['orderId'] ?? '');
    if (type == '3') {
      // NavigationService.navigateTo(OrderDetailsWithShareView(orderId: orderId));
    } else if (type == '4') {
      // NavigationService.navigateTo(OrderDetailsView(orderId: orderId));
    } else if (type == '7') {
      // NavigationService.navigateTo(
      //   const NotificationsView(),
      // );
    }
    Navigator.of(navigatorKey.currentState!.context).push(
      MaterialPageRoute(
        builder: (context) => const NotificationScreen(),
      ),
    );
  }
}

void saveFcmToken() async {
  var token = await FirebaseMessaging.instance.getToken();
}

void setupNotifications() {
  saveFcmToken();
  initializeFlutterFire();
  initLocalNotification();
  requestPermissions();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
    // if (AppStorage.isNotificationsEnabled) {
    if (event.data != {}) {
      showNotification(event, "${event.data}");
    } else {
      showNotification(event, "${event.notification}");
    }
    // Navigator.of(navigatorKey.currentState!.context).push(
    //     MaterialPageRoute(builder: (context) => const NotificationScreen()));
    print(event.data);
    print("?????????1");
    // await AuthRepository(navigatorKey.currentState!.context).hasNewNotifications();
    // if(event.data['type'] == "-1"){
    //   navigatorKey.currentState!.context.read<AuthCubit>().onUpdateAuth(false);
    //   navigatorKey.currentState!.context.read<UserCubit>().onUpdateUserData(UserModel());
    //   Utils.clearSavedData();
    //   GlobalState.instance.set("token", "");
    //   navigatorKey.currentState!.pushNamed(Routes.loginRoute);
    // }else if (event.data['type'] == "10"){
    //   UserModel user = navigatorKey.currentState!.context.read<UserCubit>().state.model;
    //   user.isApproved = true;
    //   navigatorKey.currentState!.context.read<UserCubit>().onUpdateUserData(user);
    // }else{
    //   // navigatorKey.currentState!.pushNamed(Routes.notifications);
    // }
    // } else {
    //   print("we have notifications but the user turned of the notifications");
    // }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
    handleNotificationsTap(event.data.toString());
  });
  log("Notifications init complete");
}
