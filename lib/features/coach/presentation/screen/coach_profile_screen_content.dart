import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/video_call_screen.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/voice_call_screen.dart';
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/error_ui/error_viewer/snack_bar/show_error_snackbar.dart';
import '../../../../core/ui/widgets/blur_widget.dart';
import '../../../../core/ui/widgets/clock_widget.dart';
import '../../../../core/ui/widgets/courses_carousel_widget.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import '../../../../core/ui/widgets/custom_rating_bar_widget.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/title_widget.dart';
import '../../../../core/utils/validators/error_image.dart';
import '../../../../generated/l10n.dart';
import '../../../chat/data/model/chat_model.dart';
import '../../../chat/screen/chat_details_view.dart';
import '../../../notification/presentation/controller/notification_cubit.dart';
import '../screen/../state_m/provider/coach_profile_screen_notifier.dart';
import '../state_m/course_cubit/course_cubit.dart';

class CoachProfileScreenContent extends StatefulWidget {
  const CoachProfileScreenContent({super.key});

  @override
  State<CoachProfileScreenContent> createState() =>
      _CoachProfileScreenContentState();
}

class _CoachProfileScreenContentState extends State<CoachProfileScreenContent> {
  late CoachProfileScreenNotifier sn;

  @override
  void initState() {
    CoachProfileScreenNotifier sn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<CoachProfileScreenNotifier>(context);
    sn.context = context;
    return SafeArea(
      child: CustomScrollView(slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverDelegate(
            coachModel: sn.coachEntity,
            expandedHeight: 226.h,
            child: _buildSubscriptionWidget(sn.subbed),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                ),
                BlocProvider(
                  create: (context) => CourseCubit()
                    ..getCoachCurrentCourses(trainerId: sn.coachEntity.id!),
                  child: BlocConsumer<CourseCubit, CourseState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    buildWhen: (previous, current) {
                      return current is CurrentCoursesSuccess ||
                          current is CurrentCoursesLoading;
                    },
                    builder: (context, state) {
                      return state is CurrentCoursesSuccess
                          ? CoursesCarouselWidget(
                              courses: state.currentCoursesModel.result!.items!,
                              title: Translation.of(context).courses,
                            )
                          : const CircularProgressIndicator();
                    },
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                _buildMapWidget(
                    location: LatLng(
                        sn.coachEntity.latitude!, sn.coachEntity.longitude!)),
                SizedBox(
                  height: 60.h,
                ),
                _buildRatingWidget(
                    average: sn.coachEntity.rate!,
                    fifthRate: sn.coachEntity.ratingDetails!.i5!.toDouble(),
                    firstRate: sn.coachEntity.ratingDetails!.i1!.toDouble(),
                    forthRate: sn.coachEntity.ratingDetails!.i4!.toDouble(),
                    secondRate: sn.coachEntity.ratingDetails!.i2!.toDouble(),
                    thirdRate: sn.coachEntity.ratingDetails!.i3!.toDouble()),
                Gaps.vGap24,
                _buildCommentsWidget(refId: sn.coachEntity.id!),
                Gaps.vGap24,
              ],
            ),
          ),
        ),
      ]),
    );
  }

  late GoogleMapController _controller;
  late final String mapStyle;

  void _setMapStyle() async {
    mapStyle = await rootBundle.loadString(AppConstants.MAP_STYLE_JSON);
    _controller.setMapStyle(mapStyle);
  }

  Widget _buildMapWidget({required LatLng location}) {
    return SizedBox(
      height: 266.h,
      child: location.latitude == null
          ? const Center(
              child:
                  CustomText(text: "لا يوجد مكان محدد", color: AppColors.white),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: TitleWidget(
                    title: Translation.of(context).coach_location,
                    subtitleColorTapped: () {},
                    titleColor: AppColors.white,
                  ),
                ),
                Gaps.vGap12,
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (controller) {
                      _controller = controller;
                      _setMapStyle();
                    },
                    initialCameraPosition:
                        CameraPosition(target: location, zoom: 16),
                    zoomControlsEnabled: false,
                    markers: <Marker>{
                      Marker(
                          markerId: const MarkerId("coachLoc"),
                          position: location,
                          icon: BitmapDescriptor.defaultMarker)
                    },
                  ),
                )
              ],
            ),
    );
  }

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
                    child: Image.asset(
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
              fontSize: AppConstants.textSize10,
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

  Widget _buildCommentsWidget({required int refId}) {
    return BlocProvider(
      create: (context) => CourseCubit()..getReview(RefId: refId),
      child: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SuccessGetReviewData) {
            return Padding(
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
                            image: state.reviewModel.result!.items![index]
                                .reviewer!.imageUrl
                                .toString(),
                            date: state
                                .reviewModel.result!.items![index].creationTime
                                .toString(),
                            name: state.reviewModel.result!.items![index]
                                .reviewer!.name
                                .toString(),
                            body: state
                                .reviewModel.result!.items![index].comment
                                .toString()),
                      );
                    },
                    separatorBuilder: (context, index) => Gaps.hGap16,
                    itemCount: state.reviewModel.result!.items!.length),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildRatingWidget({
    required double average,
    required double firstRate,
    required double secondRate,
    required double thirdRate,
    required double forthRate,
    required double fifthRate,
  }) {
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
                      text: '$average',
                      fontSize: AppConstants.textSize48,
                      color: AppColors.accentColorLight,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                        height: 16.h,
                        child: CustomRatingBarWidget(
                            rate: average, itemSize: 12.w)),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    _buildRateIndicatorWidget('5', firstRate),
                    _buildRateIndicatorWidget('4', secondRate),
                    _buildRateIndicatorWidget('3', thirdRate),
                    _buildRateIndicatorWidget('2', forthRate),
                    _buildRateIndicatorWidget('1', fifthRate),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionWidget(bool subbed) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius10)),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: sn.coachEntity.name!,
                    fontSize: AppConstants.textSize16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomText(
                        text: sn.coachEntity.specialization?.text ?? "",
                        color: AppColors.accentColorLight,
                        fontSize: AppConstants.textSize14,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      CustomText(
                        text:
                            '${sn.coachEntity.hoursPrice ?? 0} ${LanguageHelper.tr(context).saudi_riyal}',
                        fontSize: AppConstants.textSize14,
                        color: AppColors.accentColorLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const Spacer(),
                  // subbed
                  //     ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailsView(
                                    chatModel: ChatModel(
                                  trainerId: sn.coachEntity.id,
                                  trainerName: sn.coachEntity.name ?? "",
                                  trainerImage: sn.coachEntity.imageUrl ?? "",
                                )),
                              ));
                        },
                        child: ImageIcon(
                          const AssetImage(
                            AppConstants.CHAT_ICON,
                          ),
                          color: AppColors.white,
                          size: 30.h,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return VoiceCallScreen(
                                //trainerId: sn.coachEntity.id!,
                                );
                          }));
                          BlocProvider.of<NotificationCubit>(context)
                              .createNotifications(
                                  context, sn.coachEntity.id!, 2);
                        },
                        child: ImageIcon(
                          const AssetImage(
                            AppConstants.PHONE_CALL_ICON,
                          ),
                          color: AppColors.white,
                          size: 20.h,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return VideoCallScreen(
                              trainerId: sn.coachEntity.id!,
                            );
                          }));
                          BlocProvider.of<NotificationCubit>(context)
                              .createNotifications(
                                  context, sn.coachEntity.id!, 1);
                        },
                        child: ImageIcon(
                          const AssetImage(
                            AppConstants.VIDEO_CALL_ICON,
                          ),
                          color: AppColors.white,
                          size: 20.h,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // !subbed
        //     ? Positioned(
        //         bottom: 8.h,
        //         left: 0,
        //         right: 0,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             SizedBox(
        //               width: 217.w,
        //               height: 44.h,
        //               child: CustomElevatedButton(
        //                 text: Translation.of(context).subscribe,
        //                 onTap: (){
        //                  // Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerCoursesScreen(),));
        //                 },
        //               ),
        //             ),
        //           ],
        //         ))
        //     : const SizedBox.shrink()
      ],
    );
  }

  void _subscribe() {
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
                      width: 0.9.sw,
                      color: AppColors.grey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: Translation.of(context).course_subscription,
                              fontSize: AppConstants.textSize16,
                              fontWeight: FontWeight.bold,
                            ),
                            Gaps.vGap24,
                            CustomText(
                              text: Translation.of(context).subscription_type,
                              fontSize: AppConstants.textSize16,
                            ),
                            Container(
                              height: 44.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.borderRadius6)),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: AppColors.grey,
                                ),
                                child: DropdownButton<String>(
                                  items: [],
                                  onChanged: (c) {},
                                  isExpanded: true,
                                  underline: const SizedBox.shrink(),
                                ),
                              ),
                            ),
                            Gaps.vGap24,
                            CustomText(
                              text: Translation.of(context).weekly_hours,
                              fontSize: AppConstants.textSize16,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.white),
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.borderRadius6)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Gaps.vGap40,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 44.h,
                                    width: 217.w,
                                    child: CustomElevatedButton(
                                      text: Translation.of(context).subscribe,
                                      onTap: _setSubscriptionInfo,
                                    )),
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

  void _setSubscriptionInfo() {
    Nav.pop();
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
                      width: 0.9.sw,
                      color: AppColors.grey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: Translation.of(context).bill,
                              fontSize: AppConstants.textSize16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accentColorLight,
                            ),
                            Gaps.vGap24,
                            CustomText(
                              text: sn.courses.first.title,
                              fontSize: AppConstants.textSize14,
                              fontWeight: FontWeight.w500,
                            ),
                            Gaps.vGap8,
                            Row(
                              children: [
                                CustomText(
                                  text:
                                      "${sn.courses.first.cost.toString()} ${Translation.of(context).saudi_riyal}",
                                  fontSize: AppConstants.textSize15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.accentColorLight,
                                ),
                                const Spacer(),
                                const ClockWidget(duration: 20.0)
                              ],
                            ),
                            const Divider(
                              color: AppColors.white,
                              thickness: 1,
                            ),
                            Gaps.vGap24,
                            CustomText(
                              text: Translation.of(context).payment_way,
                              fontSize: AppConstants.textSize14,
                            ),
                            Gaps.vGap16,
                            Row(
                              children: [
                                Image.asset(
                                  AppConstants.MASTER_CARD_IMG,
                                  width: 32.w,
                                ),
                                Gaps.hGap4,
                                Column(
                                  children: [
                                    CustomText(
                                      text: 'ماستر كارد',
                                      fontSize: AppConstants.textSize14,
                                    ),
                                    CustomText(
                                      text: '32423*****',
                                      fontSize: AppConstants.textSize14,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Gaps.vGap40,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 44.h,
                                    width: 217.w,
                                    child: CustomElevatedButton(
                                      text: Translation.of(context).pay,
                                      onTap: _payment,
                                    )),
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

  TextEditingController commentController = TextEditingController();

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
                                rate: sn.rate.toDouble(),
                                itemSize: 30.w,
                                onRatingUpdate: (value) {
                                  setState(() {
                                    sn.rate = value.toInt();
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
                            BlocProvider(
                              create: (context) => CourseCubit(),
                              child: BlocConsumer<CourseCubit, CourseState>(
                                listener: (context, state) {
                                  if (state is ErrorCreateReviewData) {
                                    Navigator.pop(context);
                                    showErrorSnackBar(
                                      context: context,
                                      message: "You already reviewed this item",
                                    );
                                  }
                                  state is SuccessCreateReviewData
                                      ? Navigator.pop(context)
                                      : null;
                                },
                                builder: (context, state) {
                                  return Row(
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
                                      SizedBox(
                                          height: 30.h,
                                          width: 104.w,
                                          child: CustomElevatedButton(
                                            text: Translation.of(context).send,
                                            onTap: () {
                                              CourseCubit.get(context)
                                                  .createReview(
                                                      RefId: sn.coachEntity.id!,
                                                      comment: commentController
                                                          .text,
                                                      rate: sn.rate);
                                            },
                                          )),
                                    ],
                                  );
                                },
                              ),
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

  void _payment() {
    Nav.pop();
    setState(() {
      sn.subbed = true;
    });
  }
}

//todo refactoring
class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final CoachEntity coachModel;
  final Widget child;

  CustomSliverDelegate({
    required this.child,
    required this.coachModel,
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

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
                  coachModel.imageUrl ?? "",
                  fit: BoxFit.cover,
                  height: 250.h,
                  errorBuilder: (context, error, stackTrace) {
                    return const ErrorImage();
                  },
                )),
          ),
          SizedBox(
            height:
                appBarSize < kToolbarHeight.h ? kToolbarHeight.h : appBarSize,
            child: AppBar(
              backgroundColor: AppColors.primaryColorLight
                  .withOpacity(percent2 == 0 ? 1 : 0),
              elevation: 0.0,
              title: CustomText(
                text: coachModel.name!,
                fontSize: AppConstants.textSize18,
              ),
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
                  child: child,
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
