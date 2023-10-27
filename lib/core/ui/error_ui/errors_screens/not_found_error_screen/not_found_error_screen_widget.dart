part of '../error_widget.dart';

class NotFoundErrorScreenWidget extends StatefulWidget {
  final VoidCallback callback;
  final bool? disableRetryButton;
  final String url;

  const NotFoundErrorScreenWidget({
    Key? key,
    required this.callback,
    this.disableRetryButton,
    required this.url,
  }) : super(key: key);

  @override
  _NotFoundErrorScreenWidgetState createState() =>
      _NotFoundErrorScreenWidgetState();
}

class _NotFoundErrorScreenWidgetState extends State<NotFoundErrorScreenWidget>
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
      content: Translation.of(context).notFound(widget.url),
      icon: Icons.refresh,
      imageUrl: AppConstants.ERROR_EMPTY,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR_EMPTY,
        animationController: _controller,
      ),
    );
  }
}
