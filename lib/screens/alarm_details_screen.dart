import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../constants.dart';
import 'package:intl/intl.dart';

class AlarmDetailScreen extends StatelessWidget {
  static const String id = 'alarm_detail_screen';
  final textController = TextEditingController();
  final format = DateFormat("hh:mm a");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //TODO add Map widget
            Row(
              children: <Widget>[
                Text(
                  'Depart:',
                ),
                SizedBox(
                  height: 35.0,
                  width: 300,
                  child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: kTextFieldDecoration),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Arrive:',
                ),
                SizedBox(
                  width: 6,
                ),
                SizedBox(
                  height: 35.0,
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {},
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Ending Address'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Desired Arrival Time'),
                    SizedBox(
                      height: 35,
                      width: 120,
                      child: DateTimeField(
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final time = await DatePicker.showTime12hPicker(
                              context,
                              showTitleActions: true, onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          },
                              onConfirm: (date) {
                            print('confirm $date');
                          },
                              currentTime: DateTime.now());
                          return time;
                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('Buffer Time (min)'),
                    SizedBox(
                      height: 35,
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 35,
                      width: 100,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'Alarm Name'
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children:<Widget>[
                    Text('Estimated Commute Time'),
                    SizedBox(height: 10,),
                    Text('43 min'),
                    SizedBox(height: 115,),
                    FloatingActionButton.extended(
                        onPressed: () {},
                      label: Text('SAVE'),
                    )
                  ],
                    //TODO: estimate commute time fields, save button
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
