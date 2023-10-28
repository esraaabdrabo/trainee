import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/features/notification/presentation/view/notification_screen.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/common/style/gaps.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/ui/widgets/blur_widget.dart';
import '../../../core/ui/widgets/custom_text_field.dart';
import '../../../features/home/presentation/state_m/bloc/maps_cubit.dart';
import '../../../generated/l10n.dart';
import 'package:uuid/uuid.dart';

import 'custom_text.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const HomeAppbar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: AppColors.transparent,
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 4.w),
        child: SizedBox(
          width: 1.sw,
          height: 40.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: BlurWidget(
                  borderRadius: AppConstants.borderRadius4,
                ),
              ),
              BlocConsumer<MapsCubit, MapsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return SearchTextField(
                    suffix: controller.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              controller.clear();
                              BlocProvider.of<MapsCubit>(context)
                                  .emitPlaceSuggestion('');
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ))
                        : null,
                    hintText: Translation.of(context).search,
                    controller: controller,
                    onChanged: (String query) =>
                        BlocProvider.of<MapsCubit>(context)
                            .emitPlaceSuggestion(query),
                  );
                },
              )
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ));
            },
            child: const Icon(Icons.notifications)),
        Gaps.hGap16
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const TransparentAppBar({Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      shadowColor: AppColors.transparent,
      title: CustomText(
        text: title,
        fontSize: AppConstants.textSize18,
        fontWeight: FontWeight.bold,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
