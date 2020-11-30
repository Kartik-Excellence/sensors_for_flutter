import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:volume/volume.dart';

class SoundPad extends StatefulWidget {
  @override
  _SoundPadState createState() => _SoundPadState();
}

class _SoundPadState extends State<SoundPad> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  AudioManager audioManager;

  @override
  void initState() {
    super.initState();
    initiate();
    initPlatformState();
  }

  void initiate() {
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.durationHandler = (duration_value) {
      setState(() {
        _duration = duration_value;
      });
    };
    audioPlayer.positionHandler = (position_value) {
      setState(() {
        _position = position_value;
      });
    };
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }

  Widget btn(String string, VoidCallback voidCallback) {
    return FlatButton(
      color: Colors.white,
      textColor: Colors.black,
      onPressed: voidCallback,
      child: Text(string),
    );
  }

  double _sliderValue = 0.0;
  int maxVol, currentVol;

  Future<void> initPlatformState() async {
    print(Volume.getVol);
    await Volume.controlVolume(AudioManager
        .STREAM_MUSIC);
  }

  updateVolumes() async {
    maxVol = await Volume.getMaxVol;
    currentVol = await Volume.getVol;
    setState(() {});
  }

  setVol(int i) async {
    await Volume.setVol(i);
  }

  Widget freqSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        min: 0.0,
        max: 25.0,
        onChanged: (newRating) async {
          setState(() {
            _sliderValue = newRating;
          });
          await setVol(newRating.toInt());
          await updateVolumes();
        },
        value: _sliderValue);
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Divider(height: 50,),
          btn('Play', () => audioCache.play('chirp.wav')),
          btn('Pause', () => audioPlayer.pause()),
          btn('Stop', () => audioPlayer.stop()),
          Divider(height: 50,),
          Text(
            'Session Controller',
            style: TextStyle(color: Colors.white),
          ),
          slider(),
          Divider(height: 50,),
          Text(
            'Volume Controller',
            style: TextStyle(color: Colors.white),
          ),
          Text('Frequency:- ${_sliderValue.toInt()}',
          style: TextStyle(color: Colors.white)
          ),
          freqSlider(),
        ],
      ),
    );
  }
}
