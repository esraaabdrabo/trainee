import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/chat/data/model/chat_model.dart';
import 'package:upgrade_traine_project/features/chat/screen/chat_details_view.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/provider/coach_profile_screen_notifier.dart';
import 'package:upgrade_traine_project/features/coach/presentation/widget/profile/functions.dart';

class CoachProfileHeader extends StatefulWidget {
  const CoachProfileHeader({super.key});

  @override
  State<CoachProfileHeader> createState() => _CoachProfileHeaderState();
}

class _CoachProfileHeaderState extends State<CoachProfileHeader> {
  late CoachProfileScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<CoachProfileScreenNotifier>(context);
    sn.context = context;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.all(12.w),
      height: 120.h,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => _goToChat(context),
                child: ImageIcon(
                  const AssetImage(
                    AppConstants.CHAT_ICON,
                  ),
                  color: AppColors.white,
                  size: 30.h,
                ),
              ),
              _VoiceCallIcon(sn),
              _VideoCallIcon(sn)
            ],
          )
        ],
      ),
    );
  }

  void _goToChat(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatDetailsView(
              chatModel: ChatModel(
            traineeId: CoachProfileFunction.getMyId(context),
            trainerId: sn.coachEntity.id,
            trainerName: sn.coachEntity.name ?? "",
            trainerImage: sn.coachEntity.imageUrl ?? "",
          )),
        ));
  }
}

class _VoiceCallIcon extends StatelessWidget {
  const _VoiceCallIcon(this.sn);
  final CoachProfileScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CoachProfileFunction.goToVoiceCallScreen(context, sn),
      child: ImageIcon(
        const AssetImage(
          AppConstants.PHONE_CALL_ICON,
        ),
        color: AppColors.white,
        size: 20.h,
      ),
    );
  }
}

class _VideoCallIcon extends StatelessWidget {
  const _VideoCallIcon(this.sn);

  final CoachProfileScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CoachProfileFunction.goToVideoCallScreen(context, sn),
      child: ImageIcon(
        const AssetImage(
          AppConstants.VIDEO_CALL_ICON,
        ),
        color: AppColors.white,
        size: 20.h,
      ),
    );
  }
}
