import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/features/orders/controller/order_cubit.dart';
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


  Widget _buildListItemWidget(
      {required String platesName,
      required String platesNumber,
      required String price,
      required String PlatesImageUrl}) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 1.sw,
          height: 116.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                  child: BlurWidget(
                borderRadius: AppConstants.borderRadius10,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 28.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: platesName ?? '',
                            fontSize: AppConstants.textSize16,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            text: " عدد $platesNumber" ?? '',
                            fontSize: AppConstants.textSize14,
                          ),
                          CustomText(
                            text: "$price ريال سعودي " ?? '',
                            fontSize: AppConstants.textSize14,
                            color: AppColors.accentColorLight,
                            fontWeight: FontWeight.w700,
                          ),
                          Gaps.vGap4,
                        ],
                      ),
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstants.borderRadius10),
                      child: CustomImageWidget(
                        imgPath: PlatesImageUrl ?? '',
                        width: 96.w,
                        height: 116.h,
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  onWillPop(context) {
    if(BlocProvider.of<OrderCubit>(context).products.isNotEmpty) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: CustomText(
              text:
                  "لديك العديد من العناصر في السله في حال الرجوع سوف يتم الغائها",
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: AppConstants.textSize14,
            ),
            backgroundColor: AppColors.grey,
            title: CustomText(
              text: "تنبيه !",
              color: AppColors.accentColorLight,
              fontWeight: FontWeight.w700,
              fontSize: AppConstants.textSize18,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<OrderCubit>(context).clearCart();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.darkGrey50,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: CustomText(
                        text: "أفراغ السله",
                        fontWeight: FontWeight.w700,
                        fontSize: AppConstants.textSize14,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.accentColorLight,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: CustomText(
                        text: "ألغاء الأمر",
                        fontWeight: FontWeight.w700,
                        fontSize: AppConstants.textSize14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
    }else{
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        appBar: const TransparentAppBar(
          title: "السله",
        ),
        body: BlocBuilder
          <OrderCubit,OrderState>(builder: (context, state) {

          if(BlocProvider.of<OrderCubit>(context).products .isNotEmpty){
            return Column(
              children: [
                Expanded(
                    flex: 11,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: BlocProvider.of<OrderCubit>(context).products.length,
                              itemBuilder: (context, index) {
                                return _buildListItemWidget(
                                    price: BlocProvider.of<OrderCubit>(context).products[index].price.toString(),
                                    PlatesImageUrl: BlocProvider.of<OrderCubit>(context).products[index].productImage,
                                    platesName:BlocProvider.of<OrderCubit>(context).products[index].productName,
                                    platesNumber: BlocProvider.of<OrderCubit>(context).products[index].qty.toString());
                              }),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: CustomText(
                                    decoration: TextDecoration.underline,
                                    text: "أضافة وجبات أخري ؟",
                                    decorationColor: AppColors.yellow,
                                    color: AppColors.accentColorLight,
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    decorationThickness: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Expanded(
                    flex: 3,
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: "الفاتوره الكليه",
                                            color: AppColors.accentColorLight,
                                            fontSize: AppConstants.textSize14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          CustomText(
                                            text: "${BlocProvider.of<OrderCubit>(context).getCartPrice()} ${Translation.of(context).saudi_riyal} ",
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
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentView(amount: BlocProvider.of<OrderCubit>(context).getCartPrice(), onSuccess: (){
                                            BlocProvider.of<OrderCubit>(context).createOrder(context);
                                          },),));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.accentColorLight,
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Center(
                                            child: CustomText(
                                              text: "أطلب",
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
                        const Expanded(child: SizedBox())
                      ],
                    ))
              ],
            );
          }else{
            return const Center(child: Text("no products yet"),);
          }
        },)
      ),
    );
  }
}
