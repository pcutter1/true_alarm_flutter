
import 'package:flutter/material.dart';

class AlarmDetailScreen extends StatelessWidget {

  static const String id = 'alarm_detail_screen';

  final textController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          //TODO add Map widge,
          Row(
            //TODO: departure address field
          ),
          Row(
            //TODO: arrival address field
          ),
          //TODO: add space here
          Row(
            children: <Widget>[
              Column(
                //TODO: Arrival time picker, buffer time picker, alarm name field
              ),
              Column(
                //TODO: estimate commute time fields, save button
              ),
            ],
          ),
        ],
      ),
    );
  }
}
