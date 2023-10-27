import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final double? dotSize;
  final Color? dotColor;

  const DotWidget({
    Key? key,
    this.dotSize,
    this.dotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor ?? Colors.blue,
      ),
      height: dotSize ?? 10,
      width: dotSize ?? 10,
    );
  }
}

class JumpingDots extends StatefulWidget {
  final int numberOfDots;
  final double? dotSize;
  final Color? dotColor;
  final double? jumpHeight;

  const JumpingDots({
    Key? key,
    this.numberOfDots = 3,
    this.dotSize,
    this.dotColor,
    this.jumpHeight,
  }) : super(key: key);

  @override
  _JumpingDotsState createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;
  int animationDuration = 200;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.numberOfDots, (index) {
        //AnimatedBuilder widget will rebuild it self when
        //_animationControllers[index] value changes.
        return AnimatedBuilder(
          animation: _animationControllers[index],
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(2.5),
              //Transform widget's translate constructor will help us to move the dot
              //in upward direction by changing the offset of the dot.
              //X-axis position of dot will not change.
              //Only Y-axis position will change.
              child: Transform.translate(
                offset: Offset(0, _animations[index].value),
                child: DotWidget(
                  dotColor: widget.dotColor,
                  dotSize: widget.dotSize,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  void _initAnimation() {
    ///initialization of _animationControllers
    ///each _animationController will have same animation duration
    _animationControllers = List.generate(
      widget.numberOfDots,
      (index) {
        return AnimationController(
            vsync: this, duration: Duration(milliseconds: animationDuration));
      },
    ).toList();

    ///initialization of _animations
    ///here end value is -20
    ///end value is amount of jump.
    ///and we want our dot to jump in upward direction
    for (int i = 0; i < widget.numberOfDots; i++) {
      _animations.add(Tween<double>(
              begin: 0,
              end: widget.jumpHeight == null ? -20 : -widget.jumpHeight!)
          .animate(_animationControllers[i]));
    }
    for (int i = 0; i < widget.numberOfDots; i++) {
      _animationControllers[i].addStatusListener((status) {
        //On Complete
        if (status == AnimationStatus.completed) {
          //return of original postion
          _animationControllers[i].reverse();
          //if it is not last dot then start the animation of next dot.
          if (i != widget.numberOfDots - 1) {
            _animationControllers[i + 1].forward();
          }
        }
        //if last dot is back to its original postion then start animation of the first dot.
        // now this animation will be repeated infinitely
        if (i == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }
    //trigger animtion of first dot to start the whole animation.
    _animationControllers.first.forward();
  }
}
