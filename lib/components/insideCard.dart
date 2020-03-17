import 'package:flutter/material.dart';
import '../constants.dart';



class InsideCard extends StatelessWidget {
  final String textInside;
  final IconData iconInside;

  InsideCard({this.textInside, this.iconInside});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconInside,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          textInside,
          style: kLableTextStyle,
        ),
      ],
    );
  }
}