import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app/app_constants.dart';

typedef void RatingChangeCallback(double rating);

class ImageSmoothStarRatingData {
  final String filledImagePath, defaultImagePath, halfFilledImagePath;
  final bool? flipHalf;

  ImageSmoothStarRatingData({
    required this.filledImagePath,
    required this.defaultImagePath,
    required this.halfFilledImagePath,
    this.flipHalf,
  });
}

class SmoothStarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRated;
  final Color? color;
  final Color? borderColor;
  final double size;
  final bool allowHalfRating;
  final IconData filledIconData;
  final IconData halfFilledIconData;
  final IconData
      defaultIconData; //this is needed only when having fullRatedIconData && halfRatedIconData
  final double spacing;
  final bool isReadOnly;
  final ImageSmoothStarRatingData? imagesStars;

  SmoothStarRating({
    this.starCount = 5,
    this.isReadOnly = false,
    this.spacing = 0.0,
    this.rating = 0.0,
    this.defaultIconData = Icons.star_border,
    this.onRated,
    this.color,
    this.borderColor,
    this.size = 25,
    this.filledIconData = Icons.star,
    this.halfFilledIconData = Icons.star_half,
    this.allowHalfRating = true,
    this.imagesStars,
  });

  @override
  _SmoothStarRatingState createState() => _SmoothStarRatingState();
}

class _SmoothStarRatingState extends State<SmoothStarRating> {
  final double halfStarThreshold =
      0.53; //half star value starts from this number

  //tracks for user tapping on this widget
  bool isWidgetTapped = false;
  late double currentRating;
  late Timer? debounceTimer;
  var isEnglish = false;

  @override
  void initState() {
    currentRating = widget.rating;
    super.initState();
  }

  double localizedValue(double currentRate) {
    if (isEnglish) {
      return currentRate;
    } else {
      return (6 - currentRate).abs();
    }
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    debounceTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isEnglish = Intl.getCurrentLocale() == AppConstants.LANG_EN;
    return Material(
      color: Colors.transparent,
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: widget.spacing,
          children: List.generate(
              widget.starCount, (index) => buildStar(context, index))),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Widget icon;

    if (widget.imagesStars != null) {
      if (index >= currentRating) {
        icon = SizedBox(
          width: widget.size,
          child: Image.asset(widget.imagesStars?.defaultImagePath ?? ''),
        );
      } else if (index >
              currentRating -
                  (widget.allowHalfRating ? halfStarThreshold : 1.0) &&
          index < currentRating) {
        icon = SizedBox(
          width: widget.size,
          child: widget.imagesStars?.flipHalf ?? false
              ? Transform(
                  transform: Matrix4.rotationY(pi),
                  alignment: Alignment.center,
                  child: Image.asset(
                      widget.imagesStars?.halfFilledImagePath ?? ''))
              : Image.asset(widget.imagesStars?.halfFilledImagePath ?? ''),
        );
      } else {
        icon = SizedBox(
          width: widget.size,
          child: Image.asset(widget.imagesStars?.filledImagePath ?? ''),
        );
      }
    } else {
      if (index >= currentRating) {
        icon = Icon(
          widget.defaultIconData,
          color: widget.borderColor ?? Theme.of(context).primaryColor,
          size: widget.size,
        );
      } else if (index >
              currentRating -
                  (widget.allowHalfRating ? halfStarThreshold : 1.0) &&
          index < currentRating) {
        icon = Icon(
          widget.halfFilledIconData,
          color: widget.color ?? Theme.of(context).primaryColor,
          size: widget.size,
        );
      } else {
        icon = Icon(
          widget.filledIconData,
          color: widget.color ?? Theme.of(context).primaryColor,
          size: widget.size,
        );
      }
    }

    final Widget star = widget.isReadOnly
        ? icon
        : kIsWeb
            ? MouseRegion(
                onExit: (event) {
                  if (widget.onRated != null && !isWidgetTapped) {
                    //reset to zero only if rating is not set by user
                    setState(() {
                      currentRating = localizedValue(1);
                    });
                  }
                },
                onEnter: (event) {
                  isWidgetTapped = false; //reset
                },
                onHover: (event) {
                  RenderBox box = context.findRenderObject() as RenderBox;
                  var _pos = box.globalToLocal(event.position);
                  var i = _pos.dx / widget.size;
                  var newRating =
                      widget.allowHalfRating ? i : i.round().toDouble();
                  if (newRating > widget.starCount) {
                    newRating = widget.starCount.toDouble();
                  }
                  if (newRating < 0) {
                    newRating = 0.0;
                  }
                  setState(() {
                    currentRating =
                        localizedValue(newRating == 0 ? 1 : newRating);
                  });
                },
                child: GestureDetector(
                  onTapDown: (detail) {
                    isWidgetTapped = true;

                    RenderBox box = context.findRenderObject() as RenderBox;
                    var _pos = box.globalToLocal(detail.globalPosition);
                    var i = ((_pos.dx - widget.spacing) / widget.size);
                    var newRating =
                        widget.allowHalfRating ? i : i.round().toDouble();
                    if (newRating > widget.starCount) {
                      newRating = widget.starCount.toDouble();
                    }
                    if (newRating < 0) {
                      newRating = 0.0;
                    }
                    setState(() {
                      currentRating =
                          localizedValue(newRating == 0 ? 1 : newRating);
                    });
                    if (widget.onRated != null) {
                      widget.onRated!(normalizeRating(currentRating));
                    }
                  },
                  onHorizontalDragUpdate: (dragDetails) {
                    isWidgetTapped = true;

                    RenderBox box = context.findRenderObject() as RenderBox;
                    var _pos = box.globalToLocal(dragDetails.globalPosition);
                    var i = _pos.dx / widget.size;
                    var newRating =
                        widget.allowHalfRating ? i : i.round().toDouble();
                    if (newRating > widget.starCount) {
                      newRating = widget.starCount.toDouble();
                    }
                    if (newRating < 0) {
                      newRating = 0.0;
                    }
                    setState(() {
                      currentRating =
                          localizedValue(newRating == 0 ? 1 : newRating);
                    });
                    debounceTimer?.cancel();
                    debounceTimer =
                        Timer(const Duration(milliseconds: 100), () {
                      if (widget.onRated != null) {
                        currentRating = normalizeRating(newRating);
                        widget.onRated!(currentRating);
                      }
                    });
                  },
                  child: icon,
                ),
              )
            : GestureDetector(
                onTapDown: (detail) {
                  RenderBox box = context.findRenderObject() as RenderBox;
                  var _pos = box.globalToLocal(detail.globalPosition);
                  var i = ((_pos.dx - widget.spacing) / widget.size);
                  var newRating =
                      widget.allowHalfRating ? i : i.round().toDouble();
                  if (newRating > widget.starCount) {
                    newRating = widget.starCount.toDouble();
                  }
                  if (newRating < 0) {
                    newRating = 0.0;
                  }
                  newRating = normalizeRating(newRating);
                  setState(() {
                    currentRating =
                        localizedValue(newRating == 0 ? 1 : newRating);
                  });
                },
                onTapUp: (e) {
                  if (widget.onRated != null) widget.onRated!(currentRating);
                },
                onHorizontalDragUpdate: (dragDetails) {
                  RenderBox box = context.findRenderObject() as RenderBox;
                  var _pos = box.globalToLocal(dragDetails.globalPosition);
                  var i = _pos.dx / widget.size;
                  var newRating =
                      widget.allowHalfRating ? i : i.round().toDouble();
                  if (newRating > widget.starCount) {
                    newRating = widget.starCount.toDouble();
                  }
                  if (newRating < 0) {
                    newRating = 0.0;
                  }
                  setState(() {
                    currentRating =
                        localizedValue(newRating == 0 ? 1 : newRating);
                  });
                  debounceTimer?.cancel();
                  debounceTimer = Timer(const Duration(milliseconds: 100), () {
                    if (widget.onRated != null) {
                      currentRating = normalizeRating(newRating) == 0
                          ? 1
                          : normalizeRating(newRating);
                      widget.onRated!(currentRating);
                    }
                  });
                },
                child: icon,
              );

    return star;
  }

  double normalizeRating(double newRating) {
    double modRating = newRating;
    var k = modRating - modRating.floor();

    if (k != 0) {
      //half stars
      if (k >= halfStarThreshold) {
        modRating = modRating.floor() + 1.0;
      } else {
        modRating = modRating.floor() + 0.5;
      }
    }
    return modRating;
  }
}
