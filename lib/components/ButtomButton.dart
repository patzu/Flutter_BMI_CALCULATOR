import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String label;

  const BottomButton({
    Key key,
    @required this.label,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        color: Colors.pink,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
