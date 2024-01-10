import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/image_with_title_widget.dart';
import 'package:upgrade_traine_project/core/ui/widgets/title_widget.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/home_screen/home_screen_content.dart';

class HomeSectionWidget extends StatelessWidget {
  const HomeSectionWidget(
      {required this.title,
      required this.onSeeAllTapped,
      required this.widgets,
      required this.onItemSelected,
      this.tempImage,
      super.key});
  final String title;
  final Function onSeeAllTapped;
  final List<TempWidget> widgets;
  final Function(int index) onItemSelected;
  final String? tempImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: title,
          subtitleColorTapped: onSeeAllTapped,
          subtitle: LanguageHelper.tr(context).see_all,
        ),
        Gaps.vGap14,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widgets.isNotEmpty
                        ? Expanded(
                            child: GestureDetector(
                            onTap: () => onItemSelected(0),
                            child: ImageWithTitleWidget(
                                tempImage: tempImage,
                                title: widgets.elementAt(0).title,
                                imgPath: widgets.elementAt(0).imgPath,
                                description: widgets.elementAt(0).description),
                          ))
                        : const SizedBox.shrink(),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          widgets.length > 1
                              ? Expanded(
                                  child: GestureDetector(
                                  onTap: () => onItemSelected(1),
                                  child: ImageWithTitleWidget(
                                      tempImage: tempImage,
                                      title: widgets.elementAt(1).title,
                                      imgPath: widgets.elementAt(1).imgPath,
                                      description:
                                          widgets.elementAt(1).description),
                                ))
                              : const SizedBox.shrink(),
                          SizedBox(height: 8.w),
                          widgets.length > 2
                              ? Expanded(
                                  child: GestureDetector(
                                  onTap: () => onItemSelected(2),
                                  child: ImageWithTitleWidget(
                                      tempImage: tempImage,
                                      title: widgets.elementAt(2).title,
                                      imgPath: widgets.elementAt(2).imgPath,
                                      description:
                                          widgets.elementAt(2).description),
                                ))
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.w),
              widgets.length > 3
                  ? Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          onItemSelected(3);
                        },
                        child: ImageWithTitleWidget(
                            tempImage: tempImage,
                            title: widgets.elementAt(3).title,
                            imgPath: widgets.elementAt(3).imgPath,
                            description: widgets.elementAt(3).description),
                      ))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
