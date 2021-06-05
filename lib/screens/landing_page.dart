import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_am_rich/calculator_brain.dart';
import 'package:i_am_rich/components/ButtomButton.dart';
import 'package:i_am_rich/components/custom_appbar.dart';
import 'package:i_am_rich/components/custom_drawer.dart';
import 'package:i_am_rich/components/gender_block.dart';
import 'package:i_am_rich/components/gender_enum.dart';
import 'package:i_am_rich/components/round_icon_button.dart';
import 'package:i_am_rich/components/square_outline.dart';
import 'package:i_am_rich/constants.dart';
import 'package:i_am_rich/screens/result_page.dart';

class LandingPage extends StatefulWidget {
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Color maleCardColor = kInactiveCardColor;
  Color feMaleCardColor = kInactiveCardColor;
  int weight = 50;
  int age = 20;
  int height = 150;

  GenderEnum selectedGender;

  void onMaleSelectedFunction() {
    setState(() {
      selectedGender = GenderEnum.MALE;
    });
  }

  void onFeMaleSelectedFunction() {
    setState(() {
      selectedGender = GenderEnum.FEMALE;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: SquareOutline(
                        onPress: onMaleSelectedFunction,
                        colour: selectedGender == GenderEnum.MALE
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childWidget: GenderBlock(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: SquareOutline(
                        onPress: onFeMaleSelectedFunction,
                        colour: selectedGender == GenderEnum.FEMALE
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childWidget: GenderBlock(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SquareOutline(
                  colour: kInactiveCardColor,
                  childWidget: Column(
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
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
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
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: SquareOutline(
                        colour: kInactiveCardColor,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SquareOutline(
                        colour: kInactiveCardColor,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BottomButton(
                  label: 'CALCULATE',
                  onPress: () {
                    CalculatorBrain calculatorBrain = CalculatorBrain(
                      height: height,
                      weight: weight,
                      age: age,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultPage(
                            resultValue: calculatorBrain.calculateBMI(),
                            resultText: calculatorBrain.getResult(),
                            resultInterpretation:
                                calculatorBrain.getInterpretation(),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
