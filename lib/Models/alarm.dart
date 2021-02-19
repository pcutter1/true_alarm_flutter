class Alarm {
  final String name;
  final String startPoint;
  final String endPoint;
  final int bufferMinutes;
  final DateTime arrivalTime;
  bool isSet;


  Alarm({this.name, this.startPoint, this.endPoint, this.bufferMinutes, this.arrivalTime, this.isSet = true});

  void toggleSet() {
    isSet = !isSet;
  }

}