part of '../error_widget.dart';

class SocketErrorScreen extends StatefulWidget {
  final VoidCallback callback;
  final bool? disableRetryButton;

  const SocketErrorScreen({
    Key? key,
    required this.callback,
    this.disableRetryButton,
  }) : super(key: key);

  @override
  _SocketErrorScreentState createState() => _SocketErrorScreentState();
}

class _SocketErrorScreentState extends State<SocketErrorScreen>
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
      title: Translation.of(context).connectionErrorMessage,
      context: context,
      callback: widget.callback,
      disableRetryButton: widget.disableRetryButton ?? false,
      // content: Translation.of(context).connectionErrorMessage,
      icon: Icons.refresh,
      imageUrl: AppConstants.ERROR_INVALID,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR,
        animationController: _controller,
      ),
    );
  }
}
