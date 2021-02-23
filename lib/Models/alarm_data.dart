import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:true_alarm/Models/alarm.dart';

class AlarmData extends ChangeNotifier {

  List<Alarm> _alarms = [
    Alarm(name: 'Work', arrivalTime: DateTime(2017, 9, 7, 17, 30),)
  ];

  UnmodifiableListView<Alarm> get alarms {
    return UnmodifiableListView(_alarms);
  }

  Alarm getCurrentAlarm (int index) {
    return _alarms[index];
  }

  void addAlarm(String name, int buffer, DateTime arrivalTime) {
    final alarm = Alarm(name: name, bufferMinutes: buffer, arrivalTime: arrivalTime);
    _alarms.add(alarm);
    notifyListeners();
  }

  void toggleSet(Alarm alarm) {
    alarm.toggleSet();
    notifyListeners();
  }

  void deleteAlarm(Alarm alarm) {
    _alarms.remove(alarm);
    notifyListeners();
  }

  int get alarmCount {
    return _alarms.length;
  }

}