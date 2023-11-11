import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Future<ui.Image> iconToImage(IconData icon, double size) async {
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final textPainter = TextPainter(
    text: TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontFamily: icon.fontFamily,
        fontSize: size,
        color: Colors.black, // Customize the color if needed
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();

  textPainter.paint(canvas, Offset.zero);

  final img = await pictureRecorder.endRecording().toImage(
        textPainter.width.toInt(),
        textPainter.height.toInt(),
      );

  return img;
}

Future<Uint8List> iconToBytes(IconData icon, double size) async {
  final img = await iconToImage(icon, size);

  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  print("object");
  print(byteData?.buffer.asUint8List());
  return byteData!.buffer.asUint8List();
}
