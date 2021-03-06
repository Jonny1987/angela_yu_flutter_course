import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight,});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    if (_bmi == null) {
      _bmi = weight / pow(height/100, 2);
    }
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    calculateBMI();

    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    calculateBMI();

    if (_bmi >= 25) {
      return 'You have a higher than normal bodyweight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal bodyweight. You can ea a bit more.';
    }
  }
}