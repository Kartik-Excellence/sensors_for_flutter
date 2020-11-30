import 'package:flutter/material.dart';
import 'package:sensors_for_flutter/sensorbar.dart';
class Flash extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        actions: <Widget>[SensiorBar()],
      ),
      body: Center(
        child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[850],
            child: Center(
                child: FlatButton(
              onPressed: () {
              },
              child: Icon(
                Icons.filter_list_alt,
                color: Colors.white,
              ),
            ))),
      ),
    );
  }
}
