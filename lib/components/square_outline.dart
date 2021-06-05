import 'package:flutter/material.dart';

class SquareOutline extends StatelessWidget {
  final Widget childWidget;
  final Color colour;
  final Function onPress;

  const SquareOutline({
    Key key,
    this.childWidget,
    this.colour,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(5),
        child: childWidget,
      ),
    );
  }
}
