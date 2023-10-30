import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/orders/controller/order_cubit.dart';
import 'package:upgrade_traine_project/features/restaurant/data/model/response/plates_model.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/restaurant_view.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/search_screen.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/new_cubit/new_restaurant_cubit.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../orders/models/order_model.dart';
import '../../../orders/presenation/screens/cart_view.dart';
import '../widget/dishes_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlatesView extends StatefulWidget {
  PlatesModel platesModel;
  static const routeName = "/AllPlatesScreen";

  PlatesView({Key? key, required this.platesModel}) : super(key: key);

  @override
  State<PlatesView> createState() => _PlatesViewState();
}

class _PlatesViewState extends State<PlatesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).dishes,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => SearchScreen()));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: widget.platesModel.result!.items!.length,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            itemBuilder: (context, index) {
              return DishesView(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: AlertDialogContent(
                          id: widget.platesModel.result!.items![index].id!,
                          image: widget.platesModel.result!.items![index]
                                  .images!.isEmpty
                              ? "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
                              : widget.platesModel.result!.items![index].images!
                                  .first,
                          deliverPrice: "0",
                          description: widget.platesModel.result!.items![index]
                                  .components ??
                              "",
                          mainTitle:
                              widget.platesModel.result!.items![index].name ??
                                  "",
                          restName: widget.platesModel.result!.items![index]
                                  .restaurant!.text ??
                              "",
                          totalPrice:
                              widget.platesModel.result!.items![index].price!,
                          weight: "5",
                        ),
                        backgroundColor: AppColors.grey,
                      );
                    },
                  );
                },
                price:
                    widget.platesModel.result!.items![index].price.toString(),
                imagePlate: widget
                        .platesModel.result!.items![index].images!.isEmpty
                    ? "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
                    : widget.platesModel.result!.items![index].images!.first,
                restaurantName: widget
                    .platesModel.result!.items![index].restaurant
                    .toString(),
                plateName:
                    widget.platesModel.result!.items![index].name.toString(),
              );
            },
          ),
        ));
  }
}

class AlertDialogContent extends StatelessWidget {
  final String image;
  final String mainTitle;
  final String restName;
  final String weight;
  final String description;
  final int totalPrice;
  final int id;
  final String deliverPrice;

  const AlertDialogContent({
    Key? key,
    required this.description,
    required this.id,
    required this.image,
    required this.weight,
    required this.deliverPrice,
    required this.mainTitle,
    required this.restName,
    required this.totalPrice,
  }) : super(key: key);

  Widget TextRow(
      {required Widget? child, required String? price, required String title}) {
    return SizedBox(
      height: 40,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child ??
                  Text(
                    "$price",
                    style: const TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewRestaurantCubit(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DishImage(image: image),
          SizedBox(height: 10.h),
          CustomText(
            text: mainTitle,
            fontSize: 14.sp,
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: restName,
            fontSize: 14.sp,
          ),

          //  Row(
          //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //    children: [
          //      SizedBox(height: 10.h),
          //      CustomText(
          //        text: weight,
          //        fontSize: 14.sp,
          //      ),
          //      const Icon(
          //        FontAwesomeIcons.weightScale,
          //        color: Colors.yellow,
          //      )
          //    ],
          //  ),
          SizedBox(height: 10.h),
          CustomText(
            text: description,
            fontSize: 14.sp,
            maxLines: 4,
          ),
          SizedBox(height: 10.h),
          BlocConsumer<NewRestaurantCubit, NewRestaurantState>(
            listener: (context, state) {},
            builder: (context, state) {
              return TextRow(
                  child: null,
                  title: "السعر الكلي",
                  price:
                      "${NewRestaurantCubit.get(context).numberOfRequiredQuntity * totalPrice}");
            },
          ),
          TextRow(
              child: null, title: "سعر التوصيل", price: "غير موجود توصيل الان"),
          BlocConsumer<NewRestaurantCubit, NewRestaurantState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return TextRow(
                  price: null,
                  title: "الكميه المطلوبه",
                  child: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              NewRestaurantCubit.get(context).addQuntity();
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              color: AppColors.accentColorLight,
                              child: const Center(
                                  child: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Center(
                              child: Text(
                                  "${NewRestaurantCubit.get(context).numberOfRequiredQuntity}")),
                          InkWell(
                            onTap: () {
                              NewRestaurantCubit.get(context).munisQuntity();
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              color: AppColors.accentColorLight,
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )));
            },
          ),
          const SizedBox(
            height: 50,
          ),
          BlocConsumer<NewRestaurantCubit, NewRestaurantState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<OrderCubit>(context).addProductToCart(
                      OrderModel(
                          id,
                          NewRestaurantCubit.get(context)
                              .numberOfRequiredQuntity,
                          totalPrice,
                          mainTitle,
                          image));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartView(),
                      ));
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (c) => OrdersView(
                  //               price:
                  //                    "${NewRestaurantCubit.get(context).numberOfRequiredQuntity * totalPrice}",
                  //               platesImageUrl: image,
                  //               platesName: mainTitle,
                  //               platesNumber: NewRestaurantCubit.get(context)
                  //                   .numberOfRequiredQuntity
                  //                   .toString(),
                  //             )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentColorLight,
                    minimumSize: const Size(200, 50)),
                child: const Text(
                  "أضف الي السله",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _DishImage extends StatelessWidget {
  const _DishImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .1.sh,
      width: .3.sw,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
