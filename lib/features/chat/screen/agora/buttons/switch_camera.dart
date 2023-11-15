import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchCameraButton extends StatelessWidget {
  final AgoraClient client;
  const SwitchCameraButton(this.client, {super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: () =>
          switchCamera(sessionController: client.sessionController),
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: const Icon(
        Icons.switch_camera,
        color: Colors.blueAccent,
        size: 20.0,
      ),
    );
  }
}
