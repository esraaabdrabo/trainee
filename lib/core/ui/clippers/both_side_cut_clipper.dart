import 'package:flutter/material.dart';

class BothSidesCutClipper extends CustomClipper<Path> {
  double? clipHeight = 0, clipStart = 0, clipInside = 0;

  BothSidesCutClipper({
    this.clipHeight,
    this.clipStart,
    this.clipInside,
  });

  /// Play with scals to get more clear versions
  @override
  Path getClip(Size size) {
    clipHeight ??= 70;
    clipStart ??= size.height * 0.10;
    clipInside ??= 25;
    double clipEnd = clipStart! + clipHeight!;

    double startWidth = 0, endWidth = size.width;
    //int sign = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(startWidth, 0);
    path_0.quadraticBezierTo(
      startWidth,
      clipStart!,
      startWidth,
      clipStart! + (clipHeight! / 4.0),
    );
    path_0.quadraticBezierTo(
        startWidth + clipInside!,
        clipStart! + (clipHeight! / 4.0),
        startWidth + clipInside!,
        clipStart! + (clipHeight! / 2.0));
    path_0.quadraticBezierTo(
        startWidth + clipInside!,
        clipStart! + (clipHeight! * 3.0 / 4.0),
        startWidth,
        clipStart! + (clipHeight! * 3.0 / 4.0));
    path_0.quadraticBezierTo(
      startWidth,
      clipStart! + clipHeight!,
      startWidth,
      size.height,
    );
    path_0.lineTo(endWidth, size.height);
    path_0.quadraticBezierTo(
      endWidth,
      clipEnd,
      endWidth,
      clipEnd - (clipHeight! / 4.0),
    );
    path_0.quadraticBezierTo(
        endWidth - clipInside!,
        clipEnd - (clipHeight! / 4.0),
        endWidth - clipInside!,
        clipEnd - (clipHeight! / 2.0));
    path_0.quadraticBezierTo(
        endWidth - clipInside!,
        clipEnd - (clipHeight! * 3.0 / 4.0),
        endWidth,
        clipEnd - (clipHeight! * 3.0 / 4.0));
    path_0.quadraticBezierTo(
      endWidth,
      clipEnd - clipHeight!,
      endWidth,
      0,
    );
    path_0.lineTo(startWidth, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
