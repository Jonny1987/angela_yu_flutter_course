import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

InputDecoration kTextFieldInputDecoration({String hintText, IconData iconData}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey),
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      iconData,
      color: Colors.white,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}