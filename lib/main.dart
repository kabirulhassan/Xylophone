import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

List <Color> colors = [Colors.red,Colors.orange,Colors.yellow,Colors.green,Colors.blue,Colors.indigo,Colors.purple];

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playNote(int note)
  {
    final player = AudioCache();
    player.play('note$note.wav');
  }
  Expanded makeKey(Color c,int note)
  {
    return Expanded(
      child: TextButton(onPressed: (){
        playNote(note);
      }, child: Container(
        color: c,
      ),
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
            children: <Widget>[
              for(int i=1;i<=7;i++)
                  makeKey(colors[i-1],i),
            ],
          )
        ),
      ),
    );
  }
}
