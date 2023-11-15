import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisableVideoButton extends StatelessWidget {
  final AgoraClient client;
  const DisableVideoButton(this.client, {super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: null,
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: client.sessionController.value.isLocalVideoDisabled
          ? Colors.blueAccent
          : Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        client.sessionController.value.isLocalVideoDisabled
            ? Icons.videocam_off
            : Icons.videocam,
        color: client.sessionController.value.isLocalVideoDisabled
            ? Colors.white
            : Colors.blueAccent,
        size: 20.0,
      ),
    );
  }
}
