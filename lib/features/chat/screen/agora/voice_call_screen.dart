import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/end_call.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/buttons/mute.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/disabled_video_widget.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/functions.dart';
import 'package:upgrade_traine_project/features/chat/widgets/agora_loading.dart';
import 'agoraConfig.dart';

class VoiceCallScreen extends StatefulWidget {
  static const String routeName = "/VoiceScreen";

  final int? trainerId;
  final String channelName;
  const VoiceCallScreen(this.trainerId, this.channelName, {Key? key})
      : super(key: key);

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
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
    await _client?.engine.disableVideo();
    //must call toggle camera to show the 'disabledVideoWidget'
    await toggleCamera(sessionController: _client!.sessionController);
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
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    AgoraVideoViewer(
                        client: _client!,
                        showNumberOfUsers: true,
                        layoutType: Layout.grid,
                        disabledVideoWidget: DisabledVideoWidget(_client!)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EndCallButton(_client!),
                        MuteVoiceButton(client: _client),
                      ],
                    ),
                  ],
                )),
              ));
  }
}
