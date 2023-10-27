import 'package:flutter/material.dart';

class CustomPlaceHolder extends StatefulWidget {
  CustomPlaceHolder(
      {Key? key,
      required this.name,
      this.color1,
      this.color2,
      required this.size,
      this.fontColor,
      this.borderRadius})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String name;
  final Color? color1;
  final Color? color2;
  final double size;
  final Color? fontColor;
  final double? borderRadius;

  @override
  _CustomPlaceHolderState createState() => _CustomPlaceHolderState();
}

class _CustomPlaceHolderState extends State<CustomPlaceHolder> {
  var colors = [
    const Color.fromARGB(255, 164, 145, 189),
    const Color.fromARGB(255, 132, 102, 172),
    const Color.fromARGB(255, 253, 208, 5),
    const Color.fromARGB(255, 166, 137, 8),
    const Color.fromARGB(255, 87, 175, 201),
    const Color.fromARGB(255, 3, 73, 94),
    const Color.fromARGB(255, 228, 148, 114),
    const Color.fromARGB(255, 227, 80, 18),
  ];

  @override
  Widget build(BuildContext context) {
    var nameLetters = widget.name.split(" ");
    var firstLetter =
        (nameLetters[0].length > 0 ? nameLetters[0][0] : "").toUpperCase();

    var secondLetter = '';
    if (nameLetters.length > 1) {
      secondLetter =
          (nameLetters[1].length > 0 ? nameLetters[1][0] : "").toUpperCase();
    }

    var color1 = widget.color1;
    var color2 = widget.color2;
    color1 = color1 == null ? colors[2 * 2] : color1;
    color2 = color2 == null ? colors[1 + 2 * 2] : color2;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? 20)),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Text(
              "$firstLetter$secondLetter",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                fontSize: widget.size * 0.35,
                color:
                    widget.fontColor == null ? Colors.white : widget.fontColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
