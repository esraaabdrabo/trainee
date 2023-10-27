import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upgrade_traine_project/core/models/profile.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';

import '../../../core/ui/toast.dart';
import '../models/order_model.dart';
import '../repositories/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  List<OrderModel> products = [];

  final _orderRepo = OrderRepo();

  void addProductToCart(OrderModel orderModel){
    products.add(orderModel);
    emit(AddProductToCartState());
  }

  void clearCart(){
    products.clear();
    emit(ClearCartState());
  }

  int getCartPrice(){
    var price = 0;
    for (var element in products) {
      price += (element.price * element.qty);
    }
    emit(GetCartTotalPriceState());
    return price;
  }

  Future createOrder(BuildContext context,) async {
    emit(CreateOrderLoadingState());
    final res = await _orderRepo.createOrder(BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id!);
    res.fold(
          (err) {
        Toast.show(err);
        emit(CreateOrderErrorState());
      },
          (res) async {
        Toast.show('تم الاستراك بنجاح');
        emit(CreateOrderSuccessState());
      },
    );
  }



}
