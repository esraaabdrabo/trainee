import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/dioHelper/dio_helper.dart';
import 'package:uuid/uuid.dart';
import 'agoraConfig.dart';

class VideoCallScreen extends StatefulWidget {
  final int? trainerId;
  const VideoCallScreen({required this.trainerId, Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late final AgoraClient _client;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConstants.appId,
        channelName: const Uuid().v1(),
        tempToken: (await DioHelper.get(
                "https://api.yacotch.com/api/services/app/Agora/GetToken?Channel=${_generateChannelName()}"))
            .data,
      ),
    );
    await _client.initialize();
  }

  _generateChannelName() {}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          // appBar: const TransparentAppBar(
          //   title: "chat",
          // ),
          body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
              layoutType: Layout.floating,
              showNumberOfUsers: true,
            ),
            AgoraVideoButtons(
              client: _client,
              enabledButtons: const [
                BuiltInButtons.toggleCamera,
                BuiltInButtons.switchCamera,
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
