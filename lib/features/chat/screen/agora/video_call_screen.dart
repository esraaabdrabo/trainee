import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/ui/toast.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/end_call.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/mute.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/custom_video_buttons.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/functions.dart';
import 'package:upgrade_traine_project/features/chat/widgets/agora_loading.dart';
import 'agoraConfig.dart';

class VideoCallScreen extends StatefulWidget {
  static const String routeName = "/VideoScreen";

  final int? trainerId;
  final String channelName;
  const VideoCallScreen(this.trainerId, this.channelName, {Key? key})
      : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  AgoraClient? _client;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initAgora() async {
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConstants.appId,
        channelName: widget.channelName,
        tempToken: await AgoraFunctions.getToken(widget.channelName),
      ),
    );
    await _client?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initAgora(),
        builder: (context, snapShot) => AgoraFunctions.isInitLoading(snapShot)
            ? const AgoraLoadingBody()
            : WillPopScope(
                onWillPop: () async {
                  _client!.release();
                  return true;
                },
                child: Scaffold(
                    body: Stack(
                  children: [
                    AgoraVideoViewer(
                      client: _client!,
                      layoutType: Layout.floating,
                      showNumberOfUsers: true,
                    ),
                    AgoraVideoButtons(
                      client: _client!,
                      enabledButtons: const [
                        BuiltInButtons.toggleCamera,
                        BuiltInButtons.switchCamera,
                        BuiltInButtons.callEnd,
                        BuiltInButtons.toggleMic,
                      ],
                      muteButtonChild: MuteVoiceButton(client: _client),
                      disconnectButtonChild: const EndCallButton(),
                    )
                  ],
                )),
              ));
  }
}
