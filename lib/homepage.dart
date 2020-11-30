import 'package:flutter/material.dart';
import 'package:sensors_for_flutter/accelerometer.dart';
import 'package:sensors_for_flutter/camera.dart';
import 'package:sensors_for_flutter/flash.dart';
import 'package:sensors_for_flutter/mike.dart';
import 'package:sensors_for_flutter/speaker/speaker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Devices(Camera(), Icons.camera, 'Camera'),
                Devices(Speaker(), Icons.speaker, 'Speaker')
              ],
            ),
            Row(
              children: [
                Devices(Mike(), Icons.mic, 'Mic'),
                Devices(Flash(), Icons.flash_on, 'Flash')
              ],
            ),
            Row(
              children: [
                Devices(Accelerometer(), Icons.ac_unit, 'Accelerometer')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Devices extends StatelessWidget {
  Widget widget;
  IconData _iconData;
  String string;
  Devices(this.widget, this._iconData, this.string);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      height: 150,
      width: 150,
      child: RaisedButton(
        color: Colors.white,
        elevation: 50,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Icon(
              _iconData,
              size: 70,
            ),
            Text(
              string,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => widget));
        },
      ),
    );
  }
}
