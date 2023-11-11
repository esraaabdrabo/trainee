import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/dioHelper/dio_helper.dart';
import 'package:uuid/uuid.dart';
import 'agoraConfig.dart';

class VideoCallScreen extends StatefulWidget {
  static const String routeName = "/VideoScreen";

  final int? trainerId;
  const VideoCallScreen(this.trainerId, {Key? key}) : super(key: key);

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
          channelName: "esraaabdrabo23", //const Uuid().v1(),
          tempToken:
              "006a1be21131cd943aeab4fe2b0afa05a0bIAB4NGXk69ZyLlsCdlP/VX6TYf1EtUNqs5SQAN30J1NZ3wafZn0AAAAAIgAG8FocT7RHZQQAAQBPtEdlAgBPtEdlAwBPtEdlBABPtEdl"
          // (await DioHelper.get(
          //       "https://api.yacotch.com/api/services/app/Agora/GetToken?Channel=${_generateChannelName()}"))
          // .data,
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
