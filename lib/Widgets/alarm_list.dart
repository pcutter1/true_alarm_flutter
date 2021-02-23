import 'package:flutter/material.dart';
import 'package:true_alarm/Models/alarm_data.dart';
import 'package:true_alarm/Widgets/alarm_tile.dart';
import 'package:provider/provider.dart';

class AlarmList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmData>(
      builder: (context, alarmData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
          final alarm = alarmData.alarms[index];
          return AlarmTile(alarm: alarm,);
        },
          itemCount: alarmData.alarmCount,
        );
      }
    );
        }
  }