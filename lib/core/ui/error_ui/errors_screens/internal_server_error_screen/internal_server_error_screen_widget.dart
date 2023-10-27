part of '../error_widget.dart';

class InternalServerErrorScreenWidget extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const InternalServerErrorScreenWidget({
    Key? key,
    this.callback,
    this.disableRetryButton,
  }) : super(key: key);

  @override
  _InternalServerErrorScreenWidgetState createState() =>
      _InternalServerErrorScreenWidgetState();
}
class _InternalServerErrorScreenWidgetState extends State<InternalServerErrorScreenWidget> 
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

  Widget build(BuildContext context) {
    return buildErrorScreen(
      context: context,
      callback: widget.callback,
      disableRetryButton: widget.disableRetryButton ?? false,
      content: Translation.of(context).internalServerErrorMessage,
      icon: Icons.refresh,
      imageUrl: AppConstants.ERROR_SERVER,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR_SERVER,
        animationController: _controller,
      ),
    );
  }
}
