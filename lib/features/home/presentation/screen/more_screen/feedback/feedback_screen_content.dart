import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_button.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text_field.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/more_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/more_state.dart';

class FeedbackScreenContent extends StatelessWidget {
  const FeedbackScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreCubit(),
      child: BlocBuilder<MoreCubit, MoreState>(
        builder: (context, state) {
          return Form(
            key: BlocProvider.of<MoreCubit>(context).formKey,
            child: Padding(
              padding: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 1.sw,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.6.sh,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Gaps.vGap16,
                              Image.asset(
                                AppConstants.APP_LOGO_IMG,
                                width: 117.w,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              _buildTextFieldFullBorderWithTitle(
                                title: LanguageHelper.tr(context).subject,
                                focusNode:
                                    MoreCubit.of(context).subjectFocusNode,
                                controller:
                                    MoreCubit.of(context).subjectController,
                                textInputAction: TextInputAction.next,
                                onSubmitted: () {
                                  FocusScope.of(context).requestFocus(
                                      MoreCubit.of(context).descFocusNode);
                                },
                              ),
                              Gaps.vGap24,
                              _buildTextFieldFullBorderWithTitle(
                                  title: LanguageHelper.tr(context).details,
                                  focusNode:
                                      MoreCubit.of(context).descFocusNode,
                                  controller:
                                      MoreCubit.of(context).descController,
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: () {},
                                  maxLines: 5),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.2.sh,
                        child: Column(
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: 0.7.sw,
                              height: 44.h,
                              child: CustomElevatedButton(
                                  text: LanguageHelper.tr(context).send,
                                  onTap: () {
                                    MoreCubit.of(context).addFeedback(context);
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextFieldFullBorderWithTitle(
      {required String title,
      required FocusNode focusNode,
      required TextEditingController controller,
      required TextInputAction textInputAction,
      required Function onSubmitted,
      int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: AppConstants.textSize16,
        ),
        Gaps.vGap4,
        NormalTextField(
          controller: controller,
          focusNode: focusNode,
          inputBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white,
            ),
          ),
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
          maxLines: maxLines,
        )
      ],
    );
  }
}
