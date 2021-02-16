import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:true_alarm/Models/alarm_data.dart';
import 'package:true_alarm/screens/alarm_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AlarmData(),
      child: MaterialApp(
          home: AlarmListScreen(),
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}