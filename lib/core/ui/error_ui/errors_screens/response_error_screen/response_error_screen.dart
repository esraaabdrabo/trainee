part of '../error_widget.dart';

class ResponseErrorScreen extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const ResponseErrorScreen({Key? key, this.callback, this.disableRetryButton})
      : super(key: key);

  @override
  _ResponseErrorScreenState createState() => _ResponseErrorScreenState();
}

class _ResponseErrorScreenState extends State<ResponseErrorScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(
      callback: widget.callback,
      context: context,
      disableRetryButton: widget.disableRetryButton ?? false,
      content: Translation.of(context).responseError,
      icon: Icons.refresh,
      imageUrl: AppConstants.ERROR_INVALID,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR,
        animationController: _controller,
      ),
    );
  }
}
