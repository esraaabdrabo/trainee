// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/plates_view.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../state_m/cubit/new_cubit/new_restaurant_cubit.dart';
import '../widget/dishes_view.dart';

class DishesSectionWidget extends StatelessWidget {
  final int id;
  const DishesSectionWidget(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewRestaurantCubit()..getPlates(RestaurantId: id),
      child: BlocConsumer<NewRestaurantCubit, NewRestaurantState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: CustomText(
                      text: LanguageHelper.tr(context).dishes,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: LanguageHelper.tr(context).see_all,
                      ))
                ],
              ),
              state is SuccessGetAllData
                  ? Container(
                      height: state.platesModel!.result!.totalCount! > 2
                          ? 400.h
                          : 200.h,
                      padding: const EdgeInsets.all(8),
                      child: state.platesModel!.result!.items!.isNotEmpty
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: .75,
                                      crossAxisSpacing: 10),
                              itemCount:
                                  state.platesModel!.result!.totalCount! > 4
                                      ? 4
                                      : state.platesModel!.result!.totalCount!,
                              itemBuilder: (context, int) {
                                return DishesView(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: AlertDialogContent(
                                              image: state
                                                      .platesModel!
                                                      .result!
                                                      .items![int]
                                                      .images!
                                                      .isEmpty
                                                  ? "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
                                                  : state.platesModel!.result!
                                                      .items![int].images![0],
                                              deliverPrice:
                                                  "${state.platesModel!.result!.items![int].price}",
                                              description: state
                                                  .platesModel!
                                                  .result!
                                                  .items![int]
                                                  .components
                                                  .toString(),
                                              mainTitle: state.platesModel!
                                                  .result!.items![int].name
                                                  .toString(),
                                              restName: state
                                                  .platesModel!
                                                  .result!
                                                  .items![int]
                                                  .restaurant!
                                                  .text!,
                                              totalPrice: state.platesModel!
                                                  .result!.items![int].price!,
                                              weight: state.platesModel!.result!
                                                  .items![int].enComponents
                                                  .toString(),
                                              id: state.platesModel!.result!
                                                  .items![int].id!,
                                            ),
                                            backgroundColor: AppColors.grey,
                                          );
                                        },
                                      );
                                    },
                                    restaurantName: state.platesModel!.result!
                                        .items![int].restaurant!.text
                                        .toString(),
                                    price: state
                                        .platesModel!.result!.items![int].price
                                        .toString(),
                                    imagePlate: state.platesModel!.result!
                                            .items![int].images!.isEmpty
                                        ? "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
                                        : state.platesModel!.result!.items![int]
                                            .images![0],
                                    plateName: state
                                        .platesModel!.result!.items![int].name
                                        .toString());
                              })
                          : Center(
                              child: Text(
                                  LanguageHelper.tr(context).no_data_found)),
                    )
                  : const Center(
                      child: Center(child: CircularProgressIndicator()),
                    )
            ],
          );
        },
      ),
    );
  }
}
