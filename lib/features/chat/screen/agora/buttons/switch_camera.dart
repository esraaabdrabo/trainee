import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchCameraButton extends StatelessWidget {
  const SwitchCameraButton();

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: null,
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
