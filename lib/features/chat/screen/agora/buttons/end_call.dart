import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EndCallButton extends StatelessWidget {
  final AgoraClient client;
  const EndCallButton(
    this.client, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: () async {
        Navigator.pop(context);
        await client.release();
      },
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.redAccent,
      padding: const EdgeInsets.all(5.0),
      child: const Icon(Icons.call_end, color: Colors.white, size: 20),
    );
  }
}
