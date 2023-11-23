import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/toast.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/disable_video.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/end_call.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/mute.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/switch_camera.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/disabled_video_widget.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/functions.dart';
import 'package:upgrade_traine_project/features/chat/widgets/agora_loading.dart';
import 'agoraConfig.dart';
import 'package:agora_rtm/agora_rtm.dart';

class VideoCallScreen extends StatefulWidget {
  static const String routeName = "/VideoScreen";

  final int? trainerId;
  final String channelName;
  final String remoteName;

  const VideoCallScreen(this.trainerId, this.channelName,
      {required this.remoteName, Key? key})
      : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  AgoraClient? _client;
  AgoraRtmClient? rtmClient;
  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    _client = AgoraClient(
      agoraRtmChannelEventHandler:
          AgoraRtmChannelEventHandler(onMemberLeft: (_) {
        //show the user that the remote user left the group
        _handleMemberLeft();
      }),
      agoraEventHandlers: AgoraRtcEventHandlers(
        onUserJoined: (_, __, ___) => Toast.show("user join"),
      ),
      agoraConnectionData: AgoraConnectionData(
        rtmChannelName: widget.channelName,
        appId: AgoraConstants.appId,
        channelName: widget.channelName,
      ),
    );
    await _client?.initialize();
  }

  void _handleMemberLeft() async {
    //show the user that the remote user left the group
    Toast.show(
        LanguageHelper.tr(context).the_member_left_the_call(widget.remoteName));
    await Future.delayed(const Duration(milliseconds: 500));
    context.mounted ? Navigator.pop(context) : null;
    _client?.release();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _client!.release();
        return true;
      },
      child: Scaffold(
          body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          AgoraVideoViewer(
            client: _client!,
            disabledVideoWidget: DisabledVideoWidget(_client!, remoteName: ""),
            layoutType: Layout.floating,
            showNumberOfUsers: true,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            EndCallButton(_client!),
            DisableVideoButton(_client!),
            SwitchCameraButton(_client!),
            MuteVoiceButton(client: _client),
          ]),
        ],
      )),
    );
  }
}
