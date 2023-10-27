import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';

class EmptyErrorScreenWidget extends StatefulWidget {
  final String message;
  final String? image;
  final VoidCallback? callback;
  final buttonText;

  EmptyErrorScreenWidget({
    Key? key,
    required this.message,
    this.callback,
    this.image,
    this.buttonText,
  }) : super(key: key);

  @override
  _EmptyErrorScreenWidgetState createState() => _EmptyErrorScreenWidgetState();
}

class _EmptyErrorScreenWidgetState extends State<EmptyErrorScreenWidget>
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
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          widget.image == null
              ? Container()
              : SizedBox(
                  height: ScreenUtil().setHeight(200),
                  width: ScreenUtil().setWidth(200),
                  child: Image.asset(widget.image!),
                ),
          SizedBox(
            width: ScreenUtil().setWidth(800),
            child: Text(
              widget.message,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          if (widget.buttonText != null && widget.callback != null)
            const SizedBox(
              height: 15,
            ),
          if (widget.buttonText != null && widget.callback != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: widget.callback,
              child: Text(
                widget.buttonText ?? Translation.of(context).refresh,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
