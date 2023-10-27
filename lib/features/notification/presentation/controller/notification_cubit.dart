
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/ui/toast.dart';
import '../../data/models/notification_model.dart';
import '../../data/repositories/notification_repo.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit of(context) => BlocProvider.of(context);

  final _notificationRepo = NotificationRepo();

  List<NotificationModel> notifications = [];

  Future getNotifications(BuildContext context) async {
    emit(GetNotificationsLoading());
    final res = await _notificationRepo.getNotifications();
    res.fold(
          (err) {
        print(err);
        Toast.show(err);
        emit(GetNotificationsError());
      },
          (res) {
            notifications = res;
        emit(GetNotificationsLoaded(

        ));
      },
    );
  }

  Future createNotifications(BuildContext context,int userId,int messageType) async {
    emit(CreateNotificationsLoading());
    final res = await _notificationRepo.createNotification(userId, messageType);
    res.fold(
          (err) {
        print(err);
        Toast.show(err);
        emit(CreateNotificationsError());
      },
          (res) {
        emit(CreateNotificationsLoaded(

        ));
      },
    );
  }

}
