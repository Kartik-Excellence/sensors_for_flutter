import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundPad extends StatefulWidget {
  @override
  _SoundPadState createState() => _SoundPadState();
}

class _SoundPadState extends State<SoundPad> {
  AudioCache audioCache;
  AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(
        prefix: "assets/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4),
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                  onPressed: () {
                    audioCache.play('sounds/DTMF${index + 1}.mp3');
                  },
                  child: Center(child: Text('$index')),
                ),
              );
            },
          ),
        
        Center(
          child: IconButton(
              iconSize: 60,
              color: Colors.black,
              icon: Icon(Icons.play_arrow),
              onPressed: () {
               
              }),
        )
      ],
    );
  }
}
