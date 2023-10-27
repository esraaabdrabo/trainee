import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:upgrade_traine_project/core/ui/widgets/waiting_widget.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/new_cubit/new_restaurant_cubit.dart';
import 'package:upgrade_traine_project/features/shop/domain/entity/shop_entity.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/error_ui/error_viewer/snack_bar/show_error_snackbar.dart';
import '../../../../core/ui/widgets/blur_widget.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import '../../../../core/ui/widgets/custom_rating_bar_widget.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/title_widget.dart';
import '../../../../core/utils/validators/error_image.dart';
import '../../../../generated/l10n.dart';
import '../../../restaurant/presentation/screen/plates_view.dart';
import '../../../restaurant/presentation/screen/restaurant_details.dart';
import '../../../restaurant/presentation/widget/dishes_view.dart';
import '../state_m/shops_cubit/shops_cubit.dart';

class ShopDetails extends StatefulWidget {
  final ShopEntity shopsEntity;

  const ShopDetails({Key? key, required this.shopsEntity}) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  Widget _buildRateIndicatorWidget(String title, double percent) {
    return Row(
      children: [
        CustomText(
          text: title,
        ),
        Gaps.hGap4,
        SizedBox(
          width: 150.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
            child: LinearProgressIndicator(
              value: percent,
            ),
          ),
        )
      ],
    );
  }

  TextEditingController commentController = TextEditingController();
  double ratingvalue = 1.0;
  late GoogleMapController _controller;
  late final String mapStyle;

  void _setMapStyle() async {
    mapStyle = await rootBundle.loadString(AppConstants.MAP_STYLE_JSON);
    _controller.setMapStyle(mapStyle);
  }

  void _rate() {
    showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.transparent,
          body: GestureDetector(
            onTap: () {
              Nav.pop();
            },
            child: BlurWidget(
              blurColor: AppColors.transparent,
              blurDegree: AppConstants.blurDegree10,
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius10),
                    child: Container(
                      width: 0.8.sw,
                      color: AppColors.grey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: Translation.of(context).whats_ur_rating,
                              fontSize: AppConstants.textSize16,
                              fontWeight: FontWeight.bold,
                            ),
                            Gaps.vGap16,
                            Center(
                              child: CustomRatingBarWidget(
                                rate: widget.shopsEntity.rate!,
                                itemSize: 30.w,
                                onRatingUpdate: (value) {
                                  setState(() {
                                    ratingvalue = value;
                                  });
                                },
                              ),
                            ),
                            Gaps.vGap24,
                            CustomText(
                              text: Translation.of(context).whats_ur_opinion,
                              fontSize: AppConstants.textSize16,
                            ),
                            Gaps.vGap8,
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.white),
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.borderRadius6)),
                              child: TextFormField(
                                controller: commentController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                maxLines: 4,
                              ),
                            ),
                            Gaps.vGap40,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height: 30.h,
                                    width: 104.w,
                                    child: CustomTextButton(
                                      text: Translation.of(context).skip,
                                      onTap: () {
                                        Nav.pop();
                                      },
                                    )),
                                BlocConsumer<NewRestaurantCubit,
                                    NewRestaurantState>(
                                  listener: (context, state) {
                                    if (state is ErrorCreateReviewData) {
                                      showErrorSnackBar(
                                          context: context, message: "");
                                    }
                                    if (state is SuccessCreateReviewData) {
                                      Nav.pop();
                                      BlocProvider.of<NewRestaurantCubit>(
                                              context)
                                          .getReview(
                                              RefId: widget.shopsEntity.id!,
                                              refType: 3);
                                    }
                                  },
                                  builder: (context, state) {
                                    return SizedBox(
                                        height: 30.h,
                                        width: 104.w,
                                        child: CustomElevatedButton(
                                          text: Translation.of(context).send,
                                          onTap: () {
                                            if (commentController
                                                .text.isNotEmpty) {
                                              NewRestaurantCubit.get(context)
                                                  .createReview(
                                                      RefId: widget
                                                          .shopsEntity.id!,
                                                      refType: 3,
                                                      comment: commentController
                                                          .text,
                                                      rate:
                                                          ratingvalue.toInt());
                                            } else {
                                              showErrorSnackBar(
                                                  context: context,
                                                  message:
                                                      "please write comment");
                                            }
                                          },
                                        ));
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCommentItemWidget({
    required String body,
    required String name,
    required String image,
    required String date,
  }) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 56.h,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstants.borderRadius8),
                      child: image == "null"
                          ? Image.asset(
                              AppConstants.APP_LOGO_IMG,
                              width: 46.w,
                              height: 56.h,
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              errorBuilder: (context, error, stackTrace) {
                                return ErrorImage();
                              },
                              image,
                              height: 56.h,
                              width: 46.w,
                            ),
                    ),
                    Gaps.hGap8,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          text: name,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.textSize12,
                        ),
                        CustomText(text: date.substring(0, 10))
                      ],
                    ),
                  ],
                ),
              ),
              Gaps.vGap8,
              CustomText(
                text: body,
                fontSize: AppConstants.textSize14,
                fontWeight: FontWeight.w500,
                maxLines: 2,
                height: 2.5,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingWidget({required double? rate}) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: TitleWidget(
              title: Translation.of(context).rating_average,
              subtitleColorTapped: _rate,
              titleColor: AppColors.white,
              subtitleColor: AppColors.accentColorLight,
              subtitle: Translation.of(context).rate_now,
              subtitleSize: AppConstants.textSize14,
            ),
          ),
          Gaps.vGap24,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              children: [
                Column(
                  children: [
                    CustomText(
                      text: '$rate',
                      fontSize: AppConstants.textSize48,
                      color: AppColors.accentColorLight,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                        height: 16.h,
                        child:
                            CustomRatingBarWidget(rate: rate!, itemSize: 12.w)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    _buildRateIndicatorWidget(
                        '5', widget.shopsEntity.ratingDetails!.i5!.toDouble()),
                    _buildRateIndicatorWidget(
                        '4', widget.shopsEntity.ratingDetails!.i4!.toDouble()),
                    _buildRateIndicatorWidget(
                        '3', widget.shopsEntity.ratingDetails!.i3!.toDouble()),
                    _buildRateIndicatorWidget(
                        '2', widget.shopsEntity.ratingDetails!.i2!.toDouble()),
                    _buildRateIndicatorWidget(
                        '1', widget.shopsEntity.ratingDetails!.i1!.toDouble()),
                  ],
                ),
              ],
            ),
          ),
          Gaps.vGap24,
          BlocProvider(
              create: (context) => NewRestaurantCubit()
                ..getReview(RefId: widget.shopsEntity.id!, refType: 3),
              child: BlocConsumer<NewRestaurantCubit, NewRestaurantState>(
                builder: (context, state) {
                  return state is SuccessGetReviewData
                      ? Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: SizedBox(
                            height: 128.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return BlurWidget(
                                    width: 268.w,
                                    height: 128.h,
                                    borderRadius: AppConstants.borderRadius4,
                                    child: _buildCommentItemWidget(
                                        image: state.reviewModel.result!
                                            .items![index].reviewer!.imageUrl
                                            .toString(),
                                        date: state.reviewModel.result!
                                            .items![index].creationTime
                                            .toString(),
                                        name: state.reviewModel.result!
                                            .items![index].reviewer!.name
                                            .toString(),
                                        body: state.reviewModel.result!
                                            .items![index].comment
                                            .toString()),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    Gaps.hGap16,
                                itemCount:
                                    state.reviewModel.result!.items!.length),
                          ),
                        )
                      : WaitingWidget();
                },
                listener: (context, state) {},
              )),
        ],
      ),
    );
  }

  LatLng? latLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                  expandedHeight: 220.h,
                  image: widget.shopsEntity.cover.toString(),
                  searchTap: () {},
                  aboutRestaurant: widget.shopsEntity.description ?? "",
                  resaurantAvatar: widget.shopsEntity.logo ?? "",
                  restaurantName: widget.shopsEntity.name ?? "",
                  restaurantRate: widget.shopsEntity.rate!.toString()),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    getShopProducts(),
                    Gaps.vGap24,
                    SizedBox(
                      height: 250.h,
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          _controller = controller;
                          _setMapStyle();
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(widget.shopsEntity.latitude ?? 44.0,
                                widget.shopsEntity.longitude ?? 40.0),
                            zoom: 16),
                        zoomControlsEnabled: false,
                        markers: <Marker>{
                          Marker(
                              markerId: MarkerId("${widget.shopsEntity.id}"),
                              position: LatLng(
                                  widget.shopsEntity.latitude ?? 44.0,
                                  widget.shopsEntity.longitude ?? 40.0),
                              icon: BitmapDescriptor.defaultMarker)
                        },
                      ),
                    ),
                    Gaps.vGap24,
                    _buildRatingWidget(rate: widget.shopsEntity.rate),
                    Gaps.vGap24,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getShopProducts() {
    return BlocProvider(
      create: (context) =>
          ShopsCubit()..getProducts(shopId: widget.shopsEntity.id!),
      child: BlocConsumer<ShopsCubit, ShopsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetProductsLoaded
              ? Container(
                  height: state.productsModel.result!.totalCount! > 2
                      ? 400.h
                      : 200.h,
                  padding: const EdgeInsets.all(8),
                  child: state.productsModel.result!.items!.isNotEmpty
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1.2,
                                  crossAxisSpacing: 10),
                          itemCount: state.productsModel.result!.totalCount! > 4
                              ? 4
                              : state.productsModel.result!.totalCount!,
                          itemBuilder: (context, int) {
                            return DishesView(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: AlertDialogContent(
                                          image: state.productsModel.result!
                                                  .items![int].images!.isEmpty
                                              ? "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
                                              : state.productsModel.result!
                                                  .items![int].images![0],
                                          deliverPrice:
                                              "${state.productsModel.result!.items![int].price}",
                                          description: state.productsModel
                                              .result!.items![int].components
                                              .toString(),
                                          mainTitle: state.productsModel.result!
                                              .items![int].name
                                              .toString(),
                                          restName: state.productsModel.result!
                                              .items![int].shop!.text!,
                                          totalPrice: state.productsModel
                                              .result!.items![int].price!,
                                          weight: state.productsModel.result!
                                              .items![int].enComponents
                                              .toString(),
                                          id: state.productsModel.result!
                                              .items![int].id!,
                                        ),
                                        backgroundColor: AppColors.grey,
                                      );
                                    },
                                  );
                                },
                                restaurantName: state.productsModel.result!
                                    .items![int].shop!.text
                                    .toString(),
                                price: state
                                    .productsModel.result!.items![int].price
                                    .toString(),
                                imagePlate: state.productsModel.result!
                                        .items![int].images!.isEmpty
                                    ? "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
                                    : state.productsModel.result!.items![int]
                                        .images![0],
                                plateName: state
                                    .productsModel.result!.items![int].name
                                    .toString());
                          })
                      : const Center(child: Text("No Products")),
                )
              : const Center(
                  child: Center(child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }
}
