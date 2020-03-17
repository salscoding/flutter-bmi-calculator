import 'package:bmicalculator/components/calculateButton.dart';
import 'package:bmicalculator/components/displayCard.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: DisplayCard(
              colour: kDisplayCardColor,
              cardChild: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 35.0),
                      child: Text(resultText.toUpperCase(),
                          style: kResultTextStyle),
                    ),
                  ),
                  Expanded(
                    child: Text(bmiResult,
                        style: kBmiTextIntStyle),
                  ),
                  Expanded(
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBmiBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTilteText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
