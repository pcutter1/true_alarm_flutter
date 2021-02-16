class Alarm {
  final String name;
  bool isSet;

  Alarm({this.name, this.isSet = true});

  void toggleSet() {
    isSet = !isSet;
  }

}