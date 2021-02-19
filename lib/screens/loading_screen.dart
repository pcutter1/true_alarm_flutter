import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:true_alarm/Models/location.dart';
import 'package:true_alarm/screens/alarm_details_screen.dart';

class LoadingScreen extends StatefulWidget {

  static const String id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    LatLng locationCoordinates = await Location().getCurrentCoordinates();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AlarmDetailScreen(locationCoordinates: locationCoordinates,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: SpinKitCircle(
              color: Colors.white,
              size: 100,
            ),
          )),
    );
  }
}