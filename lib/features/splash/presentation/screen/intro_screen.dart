import 'package:flutter/material.dart';

import 'intro_screen_content.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/IntroScreen";
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: IntroScreenContent());
  }
}
