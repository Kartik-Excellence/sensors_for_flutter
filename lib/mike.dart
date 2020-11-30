import 'package:flutter/material.dart';
import 'package:sensors_for_flutter/sensorbar.dart';

class Mike extends StatefulWidget {
  @override
  _MikeState createState() => _MikeState();
}

class _MikeState extends State<Mike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        actions: <Widget>[
         SensiorBar()
        ],
      ),
      body: Center(child: Text('Mike'),),
    );
  }
}