import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/dioHelper/dio_helper.dart';
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
  late final AgoraClient _client;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    String token = await _getToken();
    print(token);
    print(widget.channelName);
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConstants.appId,
        channelName: widget.channelName,
        tempToken: token,
      ),
    );
    await _client.initialize();
  }

  

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
