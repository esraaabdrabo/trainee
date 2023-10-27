part of '../error_widget.dart';

class UnexpectedErrorScreenWidget extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const UnexpectedErrorScreenWidget(
      {Key? key, required this.callback, this.disableRetryButton})
      : super(key: key);

  @override
  _UnexpectedErrorScreenWidgetState createState() =>
      _UnexpectedErrorScreenWidgetState();
}

class _UnexpectedErrorScreenWidgetState
    extends State<UnexpectedErrorScreenWidget>
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
      title: Translation.of(context).generalErrorMessage,
      imageUrl: AppConstants.ERROR_INVALID,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR,
        animationController: _controller,
      ),
    );
  }
}
