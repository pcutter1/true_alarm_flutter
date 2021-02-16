import 'package:flutter/material.dart';

class AlarmTile extends StatelessWidget {

  final bool isSet;
  final String alarmName;
  final Function onOff;

  AlarmTile({this.alarmName, this.isSet, this.onOff});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Alarm Name'),
              Text('8:00')
            ],
          )
        ],
      ),
    );
  }
}
