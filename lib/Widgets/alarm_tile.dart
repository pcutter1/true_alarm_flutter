import 'package:flutter/material.dart';

class AlarmTile extends StatelessWidget {

  final bool isSet;
  final String alarmName;
  final DateTime arrivalTime;
  final Function onOff;

  AlarmTile({this.alarmName, this.arrivalTime, this.isSet, this.onOff});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                alarmName,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              Text(
                arrivalTime.toString(),
                style: TextStyle(
                    color: Colors.white
                ),
              )
            ],
          ),
          Column(
            //TODO: add edit and delete icons
          ),
          Column(
            //TODO: add arrival time fields
          ),
          //TODO: add toggleSet button widget
        ],
      ),
    );
  }
}
