import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void _playSound(int noteId) {
    final player = AudioCache();
    player.play('note$noteId.wav');
  }

  Expanded _buildKey(Color color, int noteId) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          _playSound(noteId);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKey(Colors.red, 1),
              _buildKey(Colors.orange, 2),
              _buildKey(Colors.yellow, 3),
              _buildKey(Colors.green, 4),
              _buildKey(Colors.blue, 5),
              _buildKey(Colors.indigo, 6),
              _buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
