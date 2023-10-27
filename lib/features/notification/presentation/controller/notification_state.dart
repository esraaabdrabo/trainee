part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}
class GetNotificationsLoading extends NotificationState {}
class GetNotificationsLoaded extends NotificationState {}
class GetNotificationsError extends NotificationState {}

class CreateNotificationsLoading extends NotificationState {}
class CreateNotificationsLoaded extends NotificationState {}
class CreateNotificationsError extends NotificationState {}


