import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../data/models/notification_model.dart';
import '../controller/notification_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  TransparentAppBar(
        title: LanguageHelper.tr(context).notifications
    ),
      body: BlocProvider(create: (context) => NotificationCubit()..getNotifications(context),
        child: BlocBuilder<NotificationCubit,NotificationState>(builder: (context, state) {
          if(state is GetNotificationsLoading){
            return WaitingWidget();
          }else{
            if(NotificationCubit.of(context).notifications.isNotEmpty){
              return  ListView.separated(
                  itemCount: NotificationCubit.of(context).notifications.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.white,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return NotificationItem(notificationModel: NotificationCubit.of(context).notifications[index]);
                  });
            }else{
              return const Center(child: Text("لا يوجد اشعارات"));
            }
          }
        },),
      )
    );
  }
}


class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationItem({Key? key, required this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Text(notificationModel.message ?? "",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
          const SizedBox(width: 10,),
          Text(notificationModel.creationTime!.substring(0,10),style: const TextStyle(color: Colors.white,fontSize: 14),)
        ],
      ),
    );
  }
}

