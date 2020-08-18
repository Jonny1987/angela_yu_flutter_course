import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = _newDiceValue();
  int rightDice = _newDiceValue();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: (){
                _rollDice();
              },
              child: Image.asset(
                'images/dice$leftDice.png',
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: (){
                _rollDice();
              },
              child: Image.asset(
                'images/dice$rightDice.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  static int _newDiceValue() {
    return Random().nextInt(6) + 1;
  }

  void _rollDice() {
    setState((){
      leftDice = _newDiceValue();
      rightDice = _newDiceValue();
    });
  }
}