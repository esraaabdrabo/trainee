import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:upgrade_traine_project/core/notifications/show.dart';

void handleOnMessageListener(RemoteMessage event) {
  // if (AppStorage.isNotificationsEnabled) {
  if (_hasChannelName(event)) {
    _showAgoraNotification(event);
  } else {
    showNotification(false, event, "${event.notification}");
  }
  // Navigator.of(navigatorKey.currentState!.context).push(
  //     MaterialPageRoute(builder: (context) => const NotificationScreen()));
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
}

void _showAgoraNotification(RemoteMessage event) =>
    showNotification(true, event, "${event.data}");

bool _hasChannelName(RemoteMessage event) => event.data['HiddenData'] != '';
