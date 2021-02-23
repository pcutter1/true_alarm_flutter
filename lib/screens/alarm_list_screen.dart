import 'package:flutter/material.dart';
import 'package:true_alarm/Widgets/alarm_list.dart';
import 'package:true_alarm/screens/loading_screen.dart';

class AlarmListScreen extends StatelessWidget {

  static const String id = 'alarm_list_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, LoadingScreen.id);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          'Alarms',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: AlarmList(),
      ),
      );
  }
}
