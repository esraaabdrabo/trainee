import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/ui/toast.dart';
import 'package:upgrade_traine_project/core/ui/widgets/no_data_found.dart';
import 'package:upgrade_traine_project/features/coach/presentation/widget/search_form_field.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/session_data.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/entities/specialization_entity.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/dialogs/custom_dialogs.dart';
import '../../../../core/ui/error_ui/errors_screens/error_widget.dart';
import '../../../../core/ui/screens/empty_screen_wiget.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import '../../../../core/ui/widgets/custom_checkBox.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../category/domain/entity/category_entity.dart';
import '../../../notification/presentation/view/notification_screen.dart';
import '../../data/model/request/get_coaches_request.dart';
import '../screen/../state_m/provider/coaches_list_screen_notifier.dart';
import '../state_m/cubit/coach_cubit.dart';
import 'coaches_list_screen_content.dart';

class CoachesListScreen extends StatefulWidget {
  static const String routeName = "/CoachesListScreen";
  final CategoryEntity? categoryEntity;

  const CoachesListScreen({Key? key, this.categoryEntity}) : super(key: key);

  @override
  _CoachesListScreenState createState() => _CoachesListScreenState();
}

class _CoachesListScreenState extends State<CoachesListScreen> {
  final sn = CoachesListScreenNotifier();

  @override
  void initState() {
    super.initState();
    _apiRequest();
    sn.categoryEntity = widget.categoryEntity;
  }

  void _apiRequest() {
    if (widget.categoryEntity != null) {
      sn.coachCubit.getCoaches(GetCoachesRequest(
        categoryId: widget.categoryEntity!.id,
      ));
      print("has entity");
    } else {
      sn.coachCubit.getCoaches(GetCoachesRequest());
    }
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CoachesListScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).coaches,
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
                child: const Icon(Icons.notifications)),
            Gaps.hGap20,
            // GestureDetector(
            //     onTap: () {
            //       showCoachesFilterDialog(context: context);
            //     },
            //     child:  ImageIcon(AssetImage(AppConstants.FILTER_ICON))),
            // Gaps.hGap12,
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            BlocBuilder<CoachCubit, CoachState>(
              bloc: sn.coachCubit,
              builder: (context, state) {
                return SizedBox(
                  height: .08.sh,
                  child: const AllCoachesSearchField(),
                );
              },
            ),
            BlocBuilder<CoachCubit, CoachState>(
              bloc: sn.coachCubit,
              builder: (context, state) {
                return state.map(
                    coachInitState: (value) => WaitingWidget(),
                    coachLoadingState: (value) =>
                        Expanded(child: WaitingWidget()),
                    coachErrorState: (value) => ErrorScreenWidget(
                        error: value.error, callback: () => _apiRequest()),
                    getCoachesState: (value) {
                      if (value.coachesEntity.items != null &&
                          value.coachesEntity.items!.isNotEmpty) {
                        for (int i = 0;
                            i < value.coachesEntity.items!.length;
                            i++) {
                          // if(value.coachesEntity.items![i].specializationId==sn.categoryEntity!.types){
                          //   sn.coaches.add(value.coachesEntity.items![i]);
                          // }
                          sn.coaches.add(value.coachesEntity.items![i]);
                        }
                      }
                      return Expanded(
                        child: sn.coaches.isNotEmpty
                            ? CoachesListScreenContent()
                            : const NoDataFoundWidget(),
                      );
                    });
              },
            ),
          ],
        ),
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

  void showCoachesFilterDialog({
    required BuildContext context,
  }) {
    List<DropdownMenuItem<SpecializationEntity>> items = [];
    items.add(DropdownMenuItem<SpecializationEntity>(
        value: SpecializationEntity(text: ''),
        child: const CustomText(
          text: '',
        )));

    items.addAll(Provider.of<SessionDataProvider>(context, listen: false)
                .specializationsEntity
                .items !=
            null
        ? Provider.of<SessionDataProvider>(context, listen: false)
            .specializationsEntity
            .items!
            .map((e) => DropdownMenuItem<SpecializationEntity>(
                value: e,
                child: CustomText(
                  text: e.text ?? '',
                )))
            .toList()
        : []);
    sn.isLowRateTemp = sn.isLowRate;
    sn.isHighRateTemp = sn.isHighRate;
    sn.isNearestTemp = sn.isNearest;
    sn.isFarthestTemp = sn.isFarthest;
    sn.specializationEntityTemp = sn.specializationEntity;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => GeneralDialogWidget(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  text: Translation.of(context).filter_by,
                  fontSize: AppConstants.textSize16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap8,
              CustomText(
                text: Translation.of(context).coach_rate,
                fontSize: AppConstants.textSize14,
                fontWeight: FontWeight.bold,
              ),
              _buildRadioButtonGroup(
                firstChoiceTitle: Translation.of(context).most_rated,
                secondChoiceTitle: Translation.of(context).least_rated,
                isFirstEnabled: sn.isHighRateTemp,
                isSecondEnabled: sn.isLowRateTemp,
                onFirstChanged: (value) {
                  setState(() {
                    sn.isHighRateTemp = value;
                  });
                },
                onSecondChanged: (value) {
                  setState(() {
                    sn.isLowRateTemp = value;
                  });
                },
              ),
              Gaps.vGap24,
              CustomText(
                text: Translation.of(context).coach_address,
                fontSize: AppConstants.textSize14,
                fontWeight: FontWeight.bold,
              ),
              _buildRadioButtonGroup(
                firstChoiceTitle: Translation.of(context).nearest,
                secondChoiceTitle: Translation.of(context).farthest,
                isFirstEnabled: sn.isNearestTemp,
                isSecondEnabled: sn.isFarthestTemp,
                onFirstChanged: (value) {
                  setState(() {
                    sn.isNearestTemp = value;
                  });
                },
                onSecondChanged: (value) {
                  setState(() {
                    sn.isFarthestTemp = value;
                  });
                },
              ),
              Gaps.vGap24,
              CustomText(
                text: Translation.of(context).coach_specialization,
                fontSize: AppConstants.textSize14,
                fontWeight: FontWeight.bold,
              ),
              Gaps.vGap16,
              Container(
                height: 44.h,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius6),
                    border: Border.all(color: AppColors.white)),
                child: DropdownButton<SpecializationEntity>(
                  dropdownColor: AppColors.grey,
                  isExpanded: true,
                  items: items,
                  value: sn.specializationEntityTemp,
                  onChanged: (va) {
                    setState(() {
                      sn.specializationEntityTemp =
                          va ?? SpecializationEntity(text: '');
                    });
                  },
                  underline: const SizedBox.shrink(),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Center(
                child: SizedBox(
                  height: 44.h,
                  width: 0.6.sw,
                  child: CustomElevatedButton(
                      onTap: () {
                        Nav.pop();
                        setState(() {
                          sn.applyFilter();
                        });
                      },
                      text: Translation.of(context).apply_filter),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
