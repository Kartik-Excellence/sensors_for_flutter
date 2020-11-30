import 'package:flutter/material.dart';
import 'package:sensors_for_flutter/sensorbar.dart';
import 'package:sensors_for_flutter/speaker/soundpad.dart';

class Speaker extends StatefulWidget {
  @override
  _SpeakerState createState() => _SpeakerState();
}

class _SpeakerState extends State<Speaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        actions: <Widget>[
         SensiorBar()
        ],
      ),
      backgroundColor: Colors.black,
      body: SoundPad(),
    );
  }
}