import 'package:flutter/material.dart';

class OvalLeftBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(40, 0);
    path.quadraticBezierTo(0, size.height / 4, 0, size.height);
    path.quadraticBezierTo(0, size.height, 40, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
