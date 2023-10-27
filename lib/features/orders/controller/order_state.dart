part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class AddProductToCartState extends OrderState {}

class ClearCartState extends OrderState {}

class GetCartTotalPriceState extends OrderState {}

class CreateOrderLoadingState extends OrderState {}
class CreateOrderSuccessState extends OrderState {}
class CreateOrderErrorState extends OrderState {}
