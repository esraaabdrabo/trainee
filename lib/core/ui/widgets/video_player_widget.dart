import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../../../core/ui/widgets/custom_text.dart';
import '../../../core/ui/widgets/waiting_widget.dart';
import '../../../generated/l10n.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final Function(int)? getMaxDuration;
  final Function(VideoPlayerController)? onControllerInitialized;
  final Function(bool isPlaying, int duration)? onISplaying;
  VideoPlayerWidget({
    required this.url,
    this.getMaxDuration,
    this.onControllerInitialized,
    this.onISplaying,
  });
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoController;
  late Timer _timer;
  bool _timeOut = false;
  double _videoWidth = 1.sw;
  // double _videoHeight = 1.sh;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 10), () {
      setState(() {
        _timeOut = true;
      });
    });
    _videoController = VideoPlayerController.network(
      widget.url,
    );

    _videoController.addListener(() {
      setState(() {});
      if (_videoController.value.isInitialized)
        widget.onISplaying?.call(_videoController.value.isPlaying,
            _videoController.value.position.inMilliseconds);
    });
    _videoController.setLooping(false);
    _videoController.initialize().whenComplete(() {
      widget.onControllerInitialized?.call(_videoController);

      widget.getMaxDuration
          ?.call(_videoController.value.duration.inMilliseconds);
    });
    _videoController.play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _timer.cancel();
    super.dispose();
  }

  Widget _buildVideoWidget() {
    return _videoController.value.isInitialized
        ? Container(
            width: _videoWidth,
            height: _videoWidth * 1 / _videoController.value.aspectRatio,
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _videoController.value.isPlaying
                        ? _videoController.pause()
                        : _videoController.play();
                  });
                },
                child: VideoPlayer(
                  _videoController,
                )),
          )
        : _timeOut
            ? Container(
                child: Center(
                  child: CustomText(
                    text: Translation.of(context).video_not_available,
                  ),
                ),
              )
            : WaitingWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildVideoWidget(),
    );
  }

/*  void _setDimensions() {
    double tempHeight;
    double tempWidth;
    tempWidth = _videoController.value.size.width ?? 0;
    tempHeight = _videoController.value.size.height ?? 0.01;

    if (tempWidth == 0.0 && tempHeight == 0.0) tempHeight = 0.01;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      double ratio = tempWidth / tempHeight;
      if (ratio > 1) {
        _videoWidth = 1.sw;
        _videoHeight = _videoWidth / ratio;
      } else if (ratio == 0) {
        _videoWidth = 1.sw;
        _videoHeight = _videoWidth / 1.778;
      } else {
        _videoWidth = 1.sw;
        _videoHeight = _videoWidth / ratio;
      }
    } else {
      double ratio = tempWidth / tempHeight;
      if (ratio > 1) {
        _videoHeight = MediaQuery.of(context).size.height * 0.5;
        _videoWidth = _videoHeight * ratio;
      } else if (ratio == 0) {
        _videoHeight = MediaQuery.of(context).size.height * 0.5;
        _videoWidth = _videoHeight * 1.77777777778;
      } else {
        _videoHeight = MediaQuery.of(context).size.height;
        _videoWidth = _videoHeight * ratio;
      }

      if (tempWidth == 0) {
        _videoHeight = 200;
        _videoWidth = 200;
      }

      if (_videoWidth > MediaQuery.of(context).size.width * 0.8)
        _videoWidth = MediaQuery.of(context).size.width * 0.8;

      if (_videoHeight > MediaQuery.of(context).size.height * 0.5)
        _videoHeight = MediaQuery.of(context).size.height * 0.5;
    }
  }*/
}
