

// class TodoField {
//   static const createdTime = 'createdTime';
// }

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    this.createdTime,
    this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
  Map<String, dynamic> toMap() {
    return {'id' : id, 'name': title, 'dateTime': createdTime};
  }
}
