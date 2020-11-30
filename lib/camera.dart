import 'package:flutter/material.dart';
import 'package:sensors_for_flutter/sensorbar.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        actions: <Widget>[
         SensiorBar()
        ],
      ),
      body: Center(child: Text('Camera'),),
    );
  }
}
