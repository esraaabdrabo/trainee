import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/orders/controller/order_cubit.dart';
import 'package:upgrade_traine_project/features/orders/presenation/widgets/orders_list.dart';
import 'package:upgrade_traine_project/features/payment/view/payment_view.dart';
import 'package:upgrade_traine_project/generated/l10n.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/blur_widget.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_image_widget.dart';
import '../../../../core/ui/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.tr(context);
    return Scaffold(
        appBar: TransparentAppBar(title: tr.cart),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (BlocProvider.of<OrderCubit>(context).products.isNotEmpty) {
              return Column(
                children: [
                  CartOrdersListWidget(),
                  SizedBox(
                      height: .1.sh,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: BlurWidget(
                              borderRadius: 0,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20, top: 0, bottom: 0, end: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomText(
                                          text: tr.totalPrice,
                                          color: AppColors.accentColorLight,
                                          fontSize: AppConstants.textSize14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        CustomText(
                                          text:
                                              "${BlocProvider.of<OrderCubit>(context).getCartPrice()} ${Translation.of(context).saudi_riyal} ",
                                          color: AppColors.accentColorLight,
                                          fontSize: AppConstants.textSize14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PaymentView(
                                                amount:
                                                    BlocProvider.of<OrderCubit>(
                                                            context)
                                                        .getCartPrice(),
                                                onSuccess: () {
                                                  BlocProvider.of<OrderCubit>(
                                                          context)
                                                      .createOrder(context);
                                                },
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.accentColorLight,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: CustomText(
                                            text: tr.order,
                                            fontWeight: FontWeight.w700,
                                            fontSize: AppConstants.textSize14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              );
            } else {
              return Center(
                child: Text(LanguageHelper.tr(context).no_data_found),
              );
            }
          },
        ));
  }
}
