part of '../error_widget.dart';

class UnknownErrorScreen extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const UnknownErrorScreen({Key? key, this.callback, this.disableRetryButton})
      : super(key: key);

  @override
  _UnknownErrorScreenState createState() => _UnknownErrorScreenState();
}

class _UnknownErrorScreenState extends State<UnknownErrorScreen>
    with SingleTickerProviderStateMixin {
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
      content: Translation.of(context).unknownError,
      icon: Icons.refresh,
      imageUrl: AppConstants.ERROR_UNKNOWING,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR_UNKNOWING,
        animationController: _controller,
      ),
    );
  }
}
