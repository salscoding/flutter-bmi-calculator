import 'package:bmicalculator/components/calculateButton.dart';
import 'package:bmicalculator/components/displayCard.dart';
import 'package:bmicalculator/components/insideCard.dart';
import 'package:bmicalculator/components/roundIcon.dart';
import 'package:bmicalculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/mainFunctionality.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

enum WeightValue {
  plus,
  minus,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  WeightValue tappedWeightValue;
  int height = 180;
  int weight = 25;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DisplayCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kDisplayCardColor
                        : kInactivedisplayCardColor,
                    cardChild: InsideCard(
                      textInside: "MALE",
                      iconInside: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: DisplayCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kDisplayCardColor
                        : kInactivedisplayCardColor,
                    cardChild: InsideCard(
                      textInside: "FEMALE",
                      iconInside: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DisplayCard(
              colour: kDisplayCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                          style: kFontWeightStyle),
                      SizedBox(width: 2.0),
                      Text(
                        'cm',
                        style: kLableTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12.0),
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DisplayCard(
                    colour: kDisplayCardColor,
                    cardChild: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',
                            style: kLableTextStyle),
                        Text(weight.toString(),
                            style: kFontWeightStyle),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                // bgColor: Color(0xFF4C4F5E),
                                iconBtnDesign:
                                    FontAwesomeIcons.minus,
                                btnTapped: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 20.0),
                            RoundIconButton(
                                // bgColor: Color(0xFF4C4F5E),
                                iconBtnDesign:
                                    FontAwesomeIcons.plus,
                                btnTapped: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DisplayCard(
                    colour: kDisplayCardColor,
                    cardChild: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLableTextStyle),
                        Text(age.toString(),
                            style: kFontWeightStyle),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                // bgColor: Color(0xFF4C4F5E),
                                iconBtnDesign:
                                    FontAwesomeIcons.minus,
                                btnTapped: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 20.0),
                            RoundIconButton(
                                // bgColor: Color(0xFF4C4F5E),
                                iconBtnDesign:
                                    FontAwesomeIcons.plus,
                                btnTapped: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            buttonTilteText: 'CALCULATE',
            onTap: () {
              MainCalculation calc = MainCalculation(
                  height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        interpretation: calc.getInterpretation(),
                        resultText: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
