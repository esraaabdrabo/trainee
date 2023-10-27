part of '../error_widget.dart';

class BadRequestErrorScreenWidget extends StatefulWidget {
  final String? message;

  const BadRequestErrorScreenWidget({Key? key, this.message}) : super(key: key);

  @override
  _BadRequestErrorScreenWidgetState createState() =>
      _BadRequestErrorScreenWidgetState();
}

class _BadRequestErrorScreenWidgetState
    extends State<BadRequestErrorScreenWidget>
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
      callback: null,
      context: context,
      disableRetryButton: false,
      title: widget.message ?? Translation.of(context).badRequest,
      imageUrl: AppConstants.ERROR_INVALID,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR,
        animationController: _controller,
      ),
    );
  }
}
