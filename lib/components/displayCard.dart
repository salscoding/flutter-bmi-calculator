import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  DisplayCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
