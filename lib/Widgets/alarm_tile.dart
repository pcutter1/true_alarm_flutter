import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:true_alarm/Models/alarm.dart';
import 'package:true_alarm/Models/alarm_data.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AlarmTile extends StatelessWidget {
  AlarmTile({this.alarm});

  final Alarm alarm;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  alarm.name,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  DateFormat.jm().format(alarm.arrivalTime).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showAlertDialog(context, alarm);
                    }),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Arrival Time',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  DateFormat.jm().format(alarm.arrivalTime).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Default"),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlutterSwitch(
                        value: alarm.isSet,
                        onToggle: (val) {
                          AlarmData().toggleSet(alarm);
                        }),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

showAlertDialog(BuildContext context, Alarm alarm) {
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {
      Provider.of<AlarmData>(context, listen: false).deleteAlarm(alarm);
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("DELETE ALARM"),
    content: Text("Would you like to delete this alarm?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
