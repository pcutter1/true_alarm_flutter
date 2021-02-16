import 'package:flutter/material.dart';
import 'package:true_alarm/Widgets/alarm_list.dart';
import 'package:true_alarm/Widgets/alarm_tile.dart';

class AlarmListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
        onPressed: () {  },
      ),
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          'Alarms',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: AlarmList(),
      ),
      );
  }
}
