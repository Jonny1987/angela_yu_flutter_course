import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.white,
          inactiveTrackColor: kLabelColor,
          thumbColor: kBottomContainerColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
          overlayColor: kBottomContainerColor.withOpacity(0.16),
        ),
      ),
      home: InputPage(),
    );
  }
}
