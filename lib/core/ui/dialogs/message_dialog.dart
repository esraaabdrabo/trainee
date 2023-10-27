import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/extensions/text_style_extension.dart';
import '../../../generated/l10n.dart';
import '../../localization/translations.dart';
import '../error_ui/errors_screens/error_widget.dart';
import 'show_dialog.dart';

showIconMessageDialog(BuildContext context,
    {IconData? topIcon,
    Color? iconColor,
    Color? iconBackgroundColor,
    String? message,
    ErrorScreenWidget? errorWidget,
    Function()? onConfirmPressed}) {
  ShowDialog().showElasticDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext myContext) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.90,
              height: errorWidget == null
                  ? MediaQuery.of(context).size.height * 0.40
                  : MediaQuery.of(context).size.height * 0.50,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(60))),
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (errorWidget == null)
                      CircleAvatar(
                        maxRadius: ScreenUtil().setWidth(50),
                        backgroundColor: iconBackgroundColor ?? Colors.green,
                        child: Icon(
                          topIcon ?? Icons.check,
                          color: iconColor ?? Colors.white,
                          size: ScreenUtil().setWidth(80),
                        ),
                      ),
                    if (errorWidget == null)
                      Text(
                        message ??
                            Translations.of(context)!
                                .translate("order_success"),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(42)),
                      )
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(25)),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.50,
                          child: FittedBox(child: errorWidget),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: onConfirmPressed ??
                              () {
                                Navigator.pop(myContext);
                              },
                          child: Text(
                            errorWidget == null
                                ? Translation.of(context).confirm
                                : Translation.of(context).ok,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

showImageMessageDialog(
  BuildContext context, {
  String? imageAssetPath,
  Color? iconColor,
  Color? iconBackgroundColor,
  String? topMessage,
  String? bottomMessage,
  String? buttonText,
  Function()? onConfirmButtonPressed,
}) {
  ShowDialog().showElasticDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext myContext) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(60))),
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(25),
                      child: SizedBox(
                        width: ScreenUtil().setSp(230),
                        child: Image.asset(imageAssetPath ?? ''),
                      ),
                    ),
                    Text(
                      topMessage ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(42)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      bottomMessage ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(35)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: onConfirmButtonPressed ??
                              () {
                                Navigator.pop(myContext);
                              },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            buttonText ?? Translation.of(context).confirm,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

class MessageDialog extends StatefulWidget {
  final Function(BuildContext) onOkPressed;
  final String? message;

  const MessageDialog({Key? key, required this.onOkPressed, this.message})
      : super(key: key);

  @override
  State createState() => MessageDialogState();
}

class MessageDialogState extends State<MessageDialog> {
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Text(Translations.of(context)!.translate("label_okay")),
          onPressed: () {
            widget.onOkPressed(context);
          },
        ),
      ],
      title: Text(
        widget.message ?? '',
        style: Colors.black.bodyText1,
      ),
    );
  }
}
