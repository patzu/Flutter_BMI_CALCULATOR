import 'package:flutter/material.dart';
import 'package:i_am_rich/constants.dart';

class HeightSliderBlock extends StatefulWidget {
  const HeightSliderBlock({Key key}) : super(key: key);

  @override
  _HeightSliderBlockState createState() => _HeightSliderBlockState();
}

class _HeightSliderBlockState extends State<HeightSliderBlock> {
  int height = 150;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'HEIGHT',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              height.toString(),
              style: kNumberTextStyle,
            ),
            Text(
              'CM',
              style: kLabelTextStyle,
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            thumbColor: Colors.pink,
            overlayColor: Colors.pink.withAlpha(70),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white60,
          ),
          child: Slider(
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
            value: height.toDouble(),
            min: 1,
            max: 250,
          ),
        ),
      ],
    );
  }
}
