import 'package:flutter/material.dart';
import 'package:i_am_rich/components/ButtomButton.dart';
import 'package:i_am_rich/components/square_outline.dart';
import 'package:i_am_rich/constants.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String resultValue;
  final String resultInterpretation;

  const ResultPage({
    Key key,
    @required this.resultText,
    @required this.resultValue,
    @required this.resultInterpretation,
  }) : super(key: key);

  // String resultText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI RESULTS'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Text(
              'YOUR RESULT',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SquareOutline(
              colour: kInactiveCardColor,
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      resultValue,
                      style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      resultInterpretation,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: BottomButton(
                      label: 'RE-CALCULATE',
                      onPress: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
