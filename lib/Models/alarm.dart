class Alarm {
  final String name;
  final String startPoint;
  final String endpoint;
  final int bufferMinutes;
  final int arrivalTime;
  bool isSet;


  Alarm({this.name, this.startPoint, this.endpoint, this.bufferMinutes, this.arrivalTime, this.isSet = true});

  void toggleSet() {
    isSet = !isSet;
  }

}