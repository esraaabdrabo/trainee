import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/chat/data/model/chat_model.dart';
import 'package:upgrade_traine_project/features/chat/widgets/video_call_icon.dart';
import 'package:upgrade_traine_project/features/chat/widgets/voic_call_icon.dart';

class AgoraActionsWidget extends StatelessWidget {
  final ChatModel chatModel;
  const AgoraActionsWidget(this.chatModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.transparent.withOpacity(0.1),
      ),
      child: Row(
        children: [
          _Name(chatModel: chatModel),
          _ProfilePicture(chatModel: chatModel),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VoiceCallIcon(chatModel.trainerId!, _getChannelName(),
                    remoteName: chatModel.trainerName!),
                const _CustomDivder(),
                VideoCallIcon(chatModel.trainerId!, _getChannelName(),
                    remoteName: chatModel.trainerName!),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _getChannelName() => "{${chatModel.trainerId!}${chatModel.traineeId!}";
}

class _CustomDivder extends StatelessWidget {
  const _CustomDivder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 1,
        color: AppColors.white,
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: chatModel.traineeImage == null
              ? const DecorationImage(
                  image: AssetImage(AppConstants.COACH1_IMAGE),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(chatModel.trainerImage ?? ""),
                ),
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: CustomText(
          text: chatModel.trainerName ?? "",
          fontWeight: FontWeight.w700,
          fontSize: AppConstants.textSize18,
        ));
  }
}
