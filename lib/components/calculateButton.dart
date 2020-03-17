import 'package:flutter/material.dart';
import '../constants.dart';

// Bottom Button Widget
class CalculateButton extends StatelessWidget {
  final Function onTap;
  final String buttonTilteText;

  CalculateButton({
    @required this.buttonTilteText,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTilteText,
          style: kButtonTextStyle,
        )),
        color: kBottomButtonColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomButtonHeight,
      ),
    );
  }
}