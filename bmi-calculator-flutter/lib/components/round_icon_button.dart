import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.onPressed,
    @required this.iconData,
  });

  final Function onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(iconData),
      fillColor: kButtonColor,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}