import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/blur_widget.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_image_widget.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/orders/controller/order_cubit.dart';

class CartOrdersListWidget extends StatelessWidget {
  const CartOrdersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 11,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      BlocProvider.of<OrderCubit>(context).products.length,
                  itemBuilder: (context, index) {
                    return _buildListItemWidget(
                        context: context,
                        price: BlocProvider.of<OrderCubit>(context)
                            .products[index]
                            .price
                            .toString(),
                        PlatesImageUrl: BlocProvider.of<OrderCubit>(context)
                            .products[index]
                            .productImage,
                        platesName: BlocProvider.of<OrderCubit>(context)
                            .products[index]
                            .productName,
                        platesNumber: BlocProvider.of<OrderCubit>(context)
                            .products[index]
                            .qty
                            .toString());
                  }),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CustomText(
                      decoration: TextDecoration.underline,
                      text: LanguageHelper.tr(context).add_another_plate,
                      decorationColor: AppColors.yellow,
                      color: AppColors.accentColorLight,
                      // fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      decorationThickness: 1,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

Widget _buildListItemWidget(
    {required BuildContext context,
    required String platesName,
    required String platesNumber,
    required String price,
    required String PlatesImageUrl}) {
  var tr = LanguageHelper.tr(context);
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
                          text: platesName,
                          fontSize: AppConstants.textSize16,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          text: " ${tr.num} $platesNumber",
                          fontSize: AppConstants.textSize14,
                        ),
                        CustomText(
                          text: "$price ${tr.saudi_riyal} ",
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
                      imgPath: PlatesImageUrl,
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
