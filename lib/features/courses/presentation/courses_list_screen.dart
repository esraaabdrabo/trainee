import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/course_cubit/course_cubit.dart';
import 'package:upgrade_traine_project/features/courses/widgets/search_form_field.dart';
import 'package:upgrade_traine_project/features/courses/widgets/search_icon.dart';
import 'package:upgrade_traine_project/main.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';

import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_checkBox.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../generated/l10n.dart';
import '../../../core/models/courses_model.dart';
import '../../../core/ui/widgets/blur_widget.dart';
import '../../../core/ui/widgets/custom_image_widget.dart';
import '../../../core/ui/widgets/custom_rating_bar_widget.dart';
import '../../notification/presentation/view/notification_screen.dart';

class TrainerCoursesScreen extends StatefulWidget {
  int? id;

  TrainerCoursesScreen({Key? key, required this.id}) : super(key: key);

  @override
  _TrainerCoursesScreenState createState() => _TrainerCoursesScreenState();
}

class _TrainerCoursesScreenState extends State<TrainerCoursesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CourseCubit>(context)
        .getCoachCurrentCourses(trainerId: widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).courses,
        actions: [
          InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  ),
              child: const Icon(Icons.notifications)),
          const AllCoursessSearchIcon()
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          AllCoursesSearchField(widget.id!),
          BlocBuilder<CourseCubit, CourseState>(
            buildWhen: (previous, current) =>
                current is CurrentCoursesLoading ||
                current is CurrentCoursesSuccess,
            builder: (context, state) {
              return Expanded(
                child: state is CurrentCoursesSuccess
                    ? ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => _buildListItemWidget(
                            state.currentCoursesModel.result!.items![index]),
                        separatorBuilder: (context, index) => Gaps.vGap16,
                        itemCount:
                            state.currentCoursesModel.result!.items!.length)
                    : const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButtonGroup({
    required String firstChoiceTitle,
    required String secondChoiceTitle,
    required bool isFirstEnabled,
    required bool isSecondEnabled,
    required Function(bool) onFirstChanged,
    required Function(bool) onSecondChanged,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 18.h,
        ),
        _buildRadioButtonItem(
          title: firstChoiceTitle,
          isEnabled: isFirstEnabled,
          onChanged: onFirstChanged,
        ),
        _buildRadioButtonItem(
          title: secondChoiceTitle,
          isEnabled: isSecondEnabled,
          onChanged: onSecondChanged,
        ),
      ],
    );
  }

  Widget _buildRadioButtonItem({
    required String title,
    required bool isEnabled,
    required Function(bool) onChanged,
  }) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(text: title),
            const Spacer(),
            SizedBox(
              height: 20.h,
              child: Transform.scale(
                scale: 1.2,
                child: CustomCheckbox(
                    activeColor: AppColors.accentColorLight,
                    value: isEnabled,
                    onChanged: (value) {
                      onChanged(value ?? false);
                    }),
              ),
            )
          ],
        ),
        const Divider(
          color: AppColors.white,
          thickness: 0.5,
        )
      ],
    );
  }

  // void showCoachesFilterDialog({
  //   required BuildContext context,
  // }) {
  //   List<DropdownMenuItem<SpecializationEntity>> items = [];
  //   items.add(DropdownMenuItem<SpecializationEntity>(
  //       value: SpecializationEntity(text: ''),
  //       child: const CustomText(
  //         text: '',
  //       )));
  //
  //   items.addAll(Provider.of<SessionDataProvider>(context, listen: false)
  //               .specializationsEntity
  //               .items !=
  //           null
  //       ? Provider.of<SessionDataProvider>(context, listen: false)
  //           .specializationsEntity
  //           .items!
  //           .map((e) => DropdownMenuItem<SpecializationEntity>(
  //               value: e,
  //               child: CustomText(
  //                 text: e.text ?? '',
  //               )))
  //           .toList()
  //       : []);
  //   sn.isLowRateTemp = sn.isLowRate;
  //   sn.isHighRateTemp = sn.isHighRate;
  //   sn.isNearestTemp = sn.isNearest;
  //   sn.isFarthestTemp = sn.isFarthest;
  //   sn.specializationEntityTemp = sn.specializationEntity;
  //
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) => GeneralDialogWidget(
  //             child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Center(
  //               child: CustomText(
  //                 text: Translation.of(context).filter_by,
  //                 fontSize: AppConstants.textSize16,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Gaps.vGap8,
  //             CustomText(
  //               text: Translation.of(context).coach_rate,
  //               fontSize: AppConstants.textSize14,
  //               fontWeight: FontWeight.bold,
  //             ),
  //             _buildRadioButtonGroup(
  //               firstChoiceTitle: Translation.of(context).most_rated,
  //               secondChoiceTitle: Translation.of(context).least_rated,
  //               isFirstEnabled: sn.isHighRateTemp,
  //               isSecondEnabled: sn.isLowRateTemp,
  //               onFirstChanged: (value) {
  //                 setState(() {
  //                   sn.isHighRateTemp = value;
  //                 });
  //               },
  //               onSecondChanged: (value) {
  //                 setState(() {
  //                   sn.isLowRateTemp = value;
  //                 });
  //               },
  //             ),
  //             Gaps.vGap24,
  //             CustomText(
  //               text: Translation.of(context).coach_address,
  //               fontSize: AppConstants.textSize14,
  //               fontWeight: FontWeight.bold,
  //             ),
  //             _buildRadioButtonGroup(
  //               firstChoiceTitle: Translation.of(context).nearest,
  //               secondChoiceTitle: Translation.of(context).farthest,
  //               isFirstEnabled: sn.isNearestTemp,
  //               isSecondEnabled: sn.isFarthestTemp,
  //               onFirstChanged: (value) {
  //                 setState(() {
  //                   sn.isNearestTemp = value;
  //                 });
  //               },
  //               onSecondChanged: (value) {
  //                 setState(() {
  //                   sn.isFarthestTemp = value;
  //                 });
  //               },
  //             ),
  //             Gaps.vGap24,
  //             CustomText(
  //               text: Translation.of(context).coach_specialization,
  //               fontSize: AppConstants.textSize14,
  //               fontWeight: FontWeight.bold,
  //             ),
  //             Gaps.vGap16,
  //             Container(
  //               height: 44.h,
  //               padding: EdgeInsets.all(8.w),
  //               decoration: BoxDecoration(
  //                   borderRadius:
  //                       BorderRadius.circular(AppConstants.borderRadius6),
  //                   border: Border.all(color: AppColors.white)),
  //               child: DropdownButton<SpecializationEntity>(
  //                 dropdownColor: AppColors.grey,
  //                 isExpanded: true,
  //                 items: items,
  //                 value: sn.specializationEntityTemp,
  //                 onChanged: (va) {
  //                   setState(() {
  //                     sn.specializationEntityTemp =
  //                         va ?? SpecializationEntity(text: '');
  //                   });
  //                 },
  //                 underline: const SizedBox.shrink(),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 60.h,
  //             ),
  //             Center(
  //               child: SizedBox(
  //                 height: 44.h,
  //                 width: 0.6.sw,
  //                 child: CustomElevatedButton(
  //                     onTap: () {
  //                       Nav.pop();
  //                       setState(() {
  //                         sn.applyFilter();
  //                       });
  //                     },
  //                     text: Translation.of(context).apply_filter),
  //               ),
  //             )
  //           ],
  //         )),
  //       );
  //     },
  //   );
  // }

  Widget _buildListItemWidget(CoursesList coursesList) {
    return GestureDetector(
      onTap: () {},
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
                          text: coursesList.name ?? '',
                          fontSize: AppConstants.textSize16,
                        ),
                        // CustomText(
                        //   text: coursesList.specialization?.text ?? '',
                        //   fontSize: AppConstants.textSize12,
                        // ),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.location_on,
                        //       color: AppColors.white,
                        //       size: 14.w,
                        //     ),
                        //     // Gaps.hGap4,
                        //     // CustomText(
                        //     //   text: coursesList.address ?? '',
                        //     //   fontSize: AppConstants.textSize10,
                        //     // ),
                        //   ],
                        // ),
                        Gaps.vGap4,
                        Row(
                          children: [
                            SizedBox(
                              height: 16.h,
                              child: CustomRatingBarWidget(
                                itemSize: 12.w,
                                rate: coursesList.rate ?? 0.0,
                              ),
                            ),
                            Gaps.hGap4,
                            CustomText(
                              text: coursesList.rate.toString(),
                              fontSize: AppConstants.textSize12,
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              CourseCubit.get(context)
                                  .bookCourse(courseId: coursesList.id!);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentView(amount: coursesList.fee!, onSuccess: (){
                              //
                              // },),));
                            },
                            child: const Text(
                              "اشتراك",
                              style: TextStyle(color: AppColors.yellow),
                            ))
                      ],
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius10),
                    child: CustomImageWidget(
                      imgPath: coursesList.imageUrl ?? '',
                      width: 96.w,
                      height: 116.h,
                    ),
                  )
                ],
              ),
            )),
            coursesList.discountPercentage != null
                ? Align(
                    alignment: LanguageHelper.isAr(navigatorKey.currentContext!)
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: BlurWidget(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 10.w),
                        child: Text(
                            " ${coursesList.discountPercentage!}% ${LanguageHelper.tr(context).off}"),
                      ),
                    ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
