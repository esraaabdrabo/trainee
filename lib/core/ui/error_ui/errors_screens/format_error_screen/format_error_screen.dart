part of '../error_widget.dart';

class FormatErrorScreen extends StatefulWidget {
 final VoidCallback? callback;
  final bool? disableRetryButton;

  const FormatErrorScreen({
    Key? key,
     this.callback,
    this.disableRetryButton,
  }) : super(key: key);

  @override
  _FormatErrorScreenState createState() =>
      _FormatErrorScreenState();
}

class _FormatErrorScreenState extends State<FormatErrorScreen> 
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
      content: Translation.of(context).generalErrorMessage,
      icon: Icons.refresh,
       imageUrl: AppConstants.ANIM_LOTTIE_ERROR_INVALID,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR,
        animationController: _controller,
      ),
    );
  }
}
