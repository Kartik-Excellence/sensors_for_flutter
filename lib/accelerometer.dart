import 'package:flutter/material.dart';
import 'package:sensors_for_flutter/sensorbar.dart';

class Accelerometer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        actions: <Widget>[
         SensiorBar()
        ],
      ),
      body: Center(child: Text('Accelerometer'),),
    );
  }
}