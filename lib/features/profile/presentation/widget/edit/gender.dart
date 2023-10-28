import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';

import 'package:upgrade_traine_project/features/profile/presentation/state_m/constants.dart';

class EditGenderWidget extends StatefulWidget {
  final TextEditingController gender;
  const EditGenderWidget(this.gender, {super.key});

  @override
  State<EditGenderWidget> createState() => _EditGenderWidgetState();
}

class _EditGenderWidgetState extends State<EditGenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: LanguageHelper.tr(context).gender,
          fontSize: AppConstants.textSize16,
        ),
        Gaps.vGap4,
        Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.white,
              ),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius6)),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.grey,
            ),
            child: DropdownButton<int>(
              value: int.tryParse(widget.gender.text),
              items: genderList(context)
                  .map((e) => DropdownMenuItem(
                        value: e == genderList(context)[0] ? 1 : 2,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (c) {
                setState(() {
                  widget.gender.text = c.toString();
                });
              },
              isExpanded: true,
              underline: const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
