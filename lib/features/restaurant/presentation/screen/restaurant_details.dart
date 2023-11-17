import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/dishes_section.dart';
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
import '../../domain/entity/restaurant_entity.dart';
import '../state_m/cubit/new_cubit/new_restaurant_cubit.dart';
class PlayingSliverState extends StatefulWidget {
  final RestaurantEntity restaurantEntity;

  const PlayingSliverState({
    Key? key,
    required this.restaurantEntity,
  }) : super(key: key);

  @override
  State<PlayingSliverState> createState() => _PlayingSliverStateState();
}

Widget _buildCommentItemWidget({
  required String body,
  required String name,
  required String image,
  required String date,
}) {
  return Padding(
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
                  child: Image.network(
                    image,
                    height: 56.h,
                    width: 46.w,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppConstants.APP_LOGO_IMG,
                        width: 46.w,
                        height: 56.h,
                        fit: BoxFit.contain,
                      );
                    },
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
  );
}

class _PlayingSliverStateState extends State<PlayingSliverState> {
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
                                rate: 4.5,
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
                                          context: context, message: state.msg);
                                    }
                                    if (state is SuccessCreateReviewData) {
                                      Nav.pop();
                                      BlocProvider.of<NewRestaurantCubit>(
                                              context)
                                          .getReview(
                                              RefId:
                                                  widget.restaurantEntity.id!,
                                              refType: 2);
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
                                                          .restaurantEntity.id!,
                                                      comment: commentController
                                                          .text,
                                                      rate: ratingvalue.toInt(),
                                                      refType: 2);
                                            } else {
                                              showErrorSnackBar(
                                                  context: context,
                                                  message:
                                                      "please write comment");
                                            }
                                          },
                                        ));
                                  },
                                ),
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

  Widget _buildRatingWidget({required double? rate}) {
    return BlocProvider(
      create: (context) => NewRestaurantCubit()
        ..getReview(RefId: widget.restaurantEntity.id!, refType: 2),
      child: BlocConsumer<NewRestaurantCubit, NewRestaurantState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is SuccessGetReviewData
              ? SizedBox(
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
                                    child: CustomRatingBarWidget(
                                        rate: rate!, itemSize: 12.w)),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                _buildRateIndicatorWidget('5', 0.95),
                                _buildRateIndicatorWidget('4', 0.65),
                                _buildRateIndicatorWidget('3', 0.1),
                                _buildRateIndicatorWidget('2', 0.3),
                                _buildRateIndicatorWidget('1', 0.2),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gaps.vGap24,
                      Padding(
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
                              separatorBuilder: (context, index) => Gaps.hGap16,
                              itemCount:
                                  state.reviewModel.result!.items!.length),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: Center(child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }

  void _setMapStyle() async {
    mapStyle = await rootBundle.loadString(AppConstants.MAP_STYLE_JSON);
    _controller.setMapStyle(mapStyle);
  }

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
                aboutRestaurant: LanguageHelper.isAr(context)
                    ? widget.restaurantEntity.arDescription
                    : widget.restaurantEntity.enDescription,
                resaurantAvatar: "${widget.restaurantEntity.logo}",
                restaurantName: "${widget.restaurantEntity.name}",
                restaurantRate: "${widget.restaurantEntity.rate}",
                image: "${widget.restaurantEntity.cover}",
                searchTap: () {},
                expandedHeight: 220.h,
              ),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    DishesSectionWidget(widget.restaurantEntity.id!),
                    Gaps.vGap24,
                    SizedBox(
                      height: 250.h,
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          _controller = controller;
                          _setMapStyle();
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                                widget.restaurantEntity.latitude ?? 44.0,
                                widget.restaurantEntity.longitude ?? 40.0),
                            zoom: 16),
                        zoomControlsEnabled: false,
                        markers: <Marker>{
                          Marker(
                              markerId:
                                  MarkerId("${widget.restaurantEntity.id}"),
                              position: LatLng(
                                  widget.restaurantEntity.latitude ?? 44.0,
                                  widget.restaurantEntity.longitude ?? 40.0),
                              icon: BitmapDescriptor.defaultMarker)
                        },
                      ),
                    ),
                    Gaps.vGap24,
                    _buildRatingWidget(rate: widget.restaurantEntity.rate),
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
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final String image;
  final void Function()? searchTap;
  final String? aboutRestaurant;
  final String resaurantAvatar;
  final String restaurantName;
  final String restaurantRate;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
    required this.image,
    required this.searchTap,
    this.aboutRestaurant,
    required this.resaurantAvatar,
    required this.restaurantName,
    required this.restaurantRate,
  });

  Widget restaurantDetails({
    required String aboutRestaurant,
    required String resaurantAvatar,
    required String restaurantName,
    required String restaurantRate,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(resaurantAvatar),
                  backgroundColor: Colors.grey,
                  radius: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(restaurantName),
                const SizedBox(
                  width: 8,
                ),
                const Icon(Icons.star, color: Colors.yellow, size: 14),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  restaurantRate,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(aboutRestaurant),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset / 1.1.h;
    final cardTopPosition = expandedHeight - 30.h - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    final appBarSize2 = expandedHeight - shrinkOffset / 2.5.h;
    final proportion2 = 2 - (expandedHeight / appBarSize2);
    final percent2 = proportion2 < 0 || proportion2 > 1 ? 0.0 : proportion2;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0,
            child: Opacity(
              opacity: percent2,
              child: Image.network(
                image,
                errorBuilder: (context, error, stackTrace) {
                  return ErrorImage();
                },
                fit: BoxFit.cover,
                height: 250.h,
              ),
            ),
          ),
          SizedBox(
            height:
                appBarSize < kToolbarHeight.h ? kToolbarHeight.h : appBarSize,
            child: AppBar(
              backgroundColor: AppColors.primaryColorLight
                  .withOpacity(percent2 == 0 ? 1 : 0),
              elevation: 0.0,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Visibility(
              visible: percent == 0 ? false : true,
              child: Opacity(
                opacity: percent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w * percent),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 122.h,
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadius10)),
                          child: restaurantDetails(
                              aboutRestaurant: aboutRestaurant ??
                                  LanguageHelper.tr(context).no_data_found,
                              resaurantAvatar: resaurantAvatar,
                              restaurantName: restaurantName,
                              restaurantRate: restaurantRate),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
