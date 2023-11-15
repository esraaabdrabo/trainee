import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/functions.dart';

class MuteVoiceButton extends StatefulWidget {
  const MuteVoiceButton({
    super.key,
    required AgoraClient? client,
  }) : _client = client;

  final AgoraClient? _client;

  @override
  State<MuteVoiceButton> createState() => _MuteVoiceButtonState();
}

class _MuteVoiceButtonState extends State<MuteVoiceButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: () {
        toggleMute(sessionController: widget._client!.sessionController);
        //to update the widget design in (fillColor,Icon)
        setState(() {});
      },
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: AgoraFunctions.isLocalMuteVoice(widget._client!)
          ? Colors.blueAccent
          : Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        AgoraFunctions.isLocalMuteVoice(widget._client!)
            ? Icons.mic_off
            : Icons.mic,
        color: AgoraFunctions.isLocalMuteVoice(widget._client!)
            ? Colors.white
            : Colors.blueAccent,
        size: 20.0,
      ),
    );
  }
}
