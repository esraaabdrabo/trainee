part of '../error_widget.dart';

class AccountNotVerifiedErrorScreen extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const AccountNotVerifiedErrorScreen(
      {Key? key, this.callback, this.disableRetryButton})
      : super(key: key);

  @override
  _AccountNotVerifiedErrorScreenState createState() =>
      _AccountNotVerifiedErrorScreenState();
}

class _AccountNotVerifiedErrorScreenState
    extends State<AccountNotVerifiedErrorScreen>
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
      content: Translation.of(context).accountNotVerifiedErrorMessage,
      icon: Icons.refresh,
      imageUrl: AppConstants.ERROR_INVALID,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR,
        animationController: _controller,
      ),
    );
  }
}
