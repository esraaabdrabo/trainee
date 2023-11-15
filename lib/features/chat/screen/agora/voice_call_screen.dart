import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
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
    _client?.engine.disableVideo();
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
                    ),
                    AgoraVideoButtons(
                      client: _client!,
                      enabledButtons: const [
                        BuiltInButtons.callEnd,
                        BuiltInButtons.toggleMic,
                      ],
                    )
                  ],
                )),
              ));
  }
}
