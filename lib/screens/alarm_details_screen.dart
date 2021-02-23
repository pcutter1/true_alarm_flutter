import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:true_alarm/Models/alarm.dart';
import 'package:true_alarm/Models/alarm_data.dart';
import 'package:true_alarm/screens/alarm_list_screen.dart';
import '../constants.dart';
import 'package:intl/intl.dart';

class AlarmDetailScreen extends StatefulWidget {

  AlarmDetailScreen({this.locationCoordinates, this.alarm});

final LatLng locationCoordinates;
final Alarm alarm;

  static const String id = 'alarm_detail_screen';

  @override
  _AlarmDetailScreenState createState() => _AlarmDetailScreenState();
}

class _AlarmDetailScreenState extends State<AlarmDetailScreen> {
  final textController = TextEditingController();
  final format = DateFormat("hh:mm a");
  GoogleMapController mapController;
  int bufferMinutes;
  DateTime arrivalTime;
  String alarmName;
  int commuteTime;
  LatLng position;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.alarm);
  }

  void updateUI(Alarm alarm) {
    setState(() {
      if (alarm == null) {
        commuteTime = 0;
        alarmName = 'Alarm Name';
        arrivalTime = DateTime.now();
        position = widget.locationCoordinates;
        bufferMinutes = 0;
        return;
      }
      commuteTime = 0;
      alarmName = widget.alarm.name;
      arrivalTime = widget.alarm.arrivalTime;
      position = widget.locationCoordinates;
      bufferMinutes = widget.alarm.bufferMinutes;
    });
  }


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget mapWidget() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: position,
        zoom: 11.0,
      ),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              Expanded(
                child: mapWidget(),
              ),
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
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: "Enter Starting Address"),
                    ),
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
                            arrivalTime = await DatePicker.showTime12hPicker(
                                context,
                                showTitleActions: true, onChanged: (date) {
                              print('change $date in time zone ' +
                                  date.timeZoneOffset.inHours.toString());
                            }, onConfirm: (date) {
                              print('confirm $date');
                            }, currentTime: DateTime.now());
                            return arrivalTime;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('Buffer Time (min)'),
                      SizedBox(
                        height: 35,
                        width: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: bufferMinutes.toString(),
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            bufferMinutes = int.parse(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 35,
                        width: 100,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(hintText: alarmName),
                          onChanged: (value) {
                            alarmName = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Estimated Commute Time'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('43 min'),
                      SizedBox(
                        height: 115,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          Provider.of<AlarmData>(context, listen: false).addAlarm(alarmName, bufferMinutes, arrivalTime);
                          Navigator.popUntil(context, ModalRoute.withName(AlarmListScreen.id));
                        },
                        label: Text('SAVE'),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
