import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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

  void addProductToCart(OrderModel orderModel) {
    int productIndex = _isProductInTheCart(orderModel);
    //if the product is found in the cart update it's information (not add a new one)
    if (productIndex >= 0) {
      products[productIndex].qty += orderModel.qty;
      products[productIndex].price += (orderModel.price * orderModel.qty);
    } else {
      //order model has the price for one item so we are multpling the price with the ordered quantity
      orderModel.price = orderModel.price * orderModel.qty;
      products.add(orderModel);
    }
    emit(AddProductToCartState());
  }

  int _isProductInTheCart(OrderModel orderModel) {
    return products
        .indexWhere((product) => product.productId == orderModel.productId);
  }

  void clearCart() {
    products.clear();
    emit(ClearCartState());
  }

  int getCartPrice() {
    var price = 0;
    for (var element in products) {
      price += (element.price * element.qty);
    }
    emit(GetCartTotalPriceState());
    return price;
  }

  Future createOrder(
    BuildContext context,
  ) async {
    emit(CreateOrderLoadingState());
    final res = await _orderRepo.createOrder(
        BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id!);
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
