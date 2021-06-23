import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playAudio(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Expanded buildKey({required int note, required Color color}) => Expanded(
    child: TextButton(
      onPressed: () {
        playAudio(note);
      },
      child: Container(
        color: color,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(note: 1, color: Colors.red),
                buildKey(note: 2, color: Colors.green),
                buildKey(note: 3, color: Colors.amber),
                buildKey(note: 4, color: Colors.yellow),
                buildKey(note: 5, color: Colors.blue),
                buildKey(note: 6, color: Colors.teal),
                buildKey(note: 7, color: Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
