import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MuteVoiceButton extends StatelessWidget {
  const MuteVoiceButton({
    super.key,
    required AgoraClient? client,
  }) : _client = client;

  final AgoraClient? _client;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: () => null,
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor:
          _client!.sessionController.value.isLocalUserMuted
              ? Colors.blueAccent
              : Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        _client!.sessionController.value.isLocalUserMuted
            ? Icons.mic_off
            : Icons.mic,
        color:
            _client!.sessionController.value.isLocalUserMuted
                ? Colors.white
                : Colors.blueAccent,
        size: 20.0,
      ),
    );
  }
}
