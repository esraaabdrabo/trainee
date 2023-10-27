part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class CreatePaymentLoaded extends PaymentState {}
class CreatePaymentLoading extends PaymentState {}
class CreatePaymentError extends PaymentState {}

class AssignSubscriptionToUserLoaded extends PaymentState {}
class AssignSubscriptionToUserLoading extends PaymentState {}
class AssignSubscriptionToUserError extends PaymentState {}
