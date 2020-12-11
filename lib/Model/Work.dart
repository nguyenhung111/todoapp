class Work {
  int id;
  String name;
  String dateTime;

  Work({this.id, this.name, this.dateTime});
  Map<String, dynamic> toMap() {
    return {'id' : id, 'name': name, 'dateTime': dateTime};
  }
}