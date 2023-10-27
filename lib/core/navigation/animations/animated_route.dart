import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AnimatedRoute extends PageRouteBuilder {
  final Widget page;

  AnimatedRoute({required this.page, required RouteSettings settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ListenableProvider(
              create: (context) => animation,
              child: page,
            );
          },
          transitionDuration: const Duration(
            milliseconds: 1100,
          ),
          settings: settings,
        );
}

class SlidingAnimated extends StatelessWidget {
  final double initialOffsetX;
  final double intervalStart;
  final double intervalEnd;
  final Widget child;

  const SlidingAnimated({
    Key? key,
    required this.initialOffsetX,
    required this.intervalStart,
    required this.intervalEnd,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(initialOffsetX, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              curve: Interval(
                intervalStart,
                intervalEnd,
                curve: Curves.ease,
              ),
              parent: animation,
            ),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}

class FadeAnimated extends StatelessWidget {
  final double intervalStart;
  final double intervalEnd;
  final Widget child;

  const FadeAnimated({
    Key? key,
    required this.intervalStart,
    required this.intervalEnd,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(
          child: child,
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              curve: Interval(
                intervalStart,
                intervalEnd,
                curve: Curves.bounceInOut,
              ),
              parent: animation,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
