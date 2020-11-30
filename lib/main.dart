import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors_for_flutter/homepage.dart';
import 'package:sensors_for_flutter/sensorbar.dart';

void main() {
  runApp(Sensors());
}

class Sensors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App for sensors',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
         leading: SensiorBar(),
         shadowColor: Colors.blue,
         elevation: 20,
         title: Text('Flutter Sensor'),
         
        ),
        backgroundColor: Colors.black,
        body: HomePage()
      ),
    );
  }
}


