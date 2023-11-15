import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/functions.dart';

class DisableVideoButton extends StatefulWidget {
  final AgoraClient client;
  const DisableVideoButton(this.client, {super.key});

  @override
  State<DisableVideoButton> createState() => _DisableVideoButtonState();
}

class _DisableVideoButtonState extends State<DisableVideoButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: () {
        toggleCamera(sessionController: widget.client.sessionController);
        //to update the widget design in (fillColor,Icon)
        setState(() {});
      },
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: AgoraFunctions.isLocalDisabledVideo(widget.client)
          ? Colors.blueAccent
          : Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        AgoraFunctions.isLocalDisabledVideo(widget.client)
            ? Icons.videocam_off
            : Icons.videocam,
        color: AgoraFunctions.isLocalDisabledVideo(widget.client)
            ? Colors.white
            : Colors.blueAccent,
        size: 20.0,
      ),
    );
  }
}
