import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'agoraConfig.dart';

class VoiceCallScreen extends StatefulWidget {
  final int id;
  final String channelName;
  const VoiceCallScreen(this.id, this.channelName, {Key? key}) : super(key: key);

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  late AgoraClient _client;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    _client = AgoraClient(
        agoraChannelData: AgoraChannelData(),
        agoraConnectionData: AgoraConnectionData(
          appId: AgoraConstants.appId,
          channelName: "esraaabdrabo23",
          tempToken:
              "007eJxTYPjN8z7cPelE3DVnj3lVe+xdTHsfsOafzj/HWTfvpJb0ubMKDCmGKalJZkmJiZYGxiaWiYaWqWamZsZmxiZGlokGialGnpEqqQ2BjAwX9k9gZGSAQBCfjyG1uCgxMTEppSgxKd/ImIEBAKqvIvY=",
        ));
    await _client.initialize();
    _client.engine.disableVideo();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          //  appBar: const TransparentAppBar(
          //    title: "chat",
          //  ),
          body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
              layoutType: Layout.floating,
            ),
            AgoraVideoButtons(
              client: _client,
              enabledButtons: const [
                // BuiltInButtons.toggleCamera,
                // BuiltInButtons.switchCamera,
                BuiltInButtons.callEnd,
                BuiltInButtons.toggleMic,
              ],
            )
          ],
        ),
      )),
    );
  }
}
