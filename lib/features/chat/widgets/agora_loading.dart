import 'package:flutter/material.dart';

class AgoraLoadingBody extends StatelessWidget {
  const AgoraLoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
