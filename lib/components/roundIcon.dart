import 'package:flutter/material.dart';

//Custom Design Button
class RoundIconButton extends StatelessWidget {
  final IconData iconBtnDesign;
  final Function btnTapped;

  RoundIconButton(
      {@required this.iconBtnDesign,
      @required this.btnTapped});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: btnTapped,
      elevation: 6.0,
      child: Icon(iconBtnDesign),
      constraints: BoxConstraints.tightFor(
          width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}