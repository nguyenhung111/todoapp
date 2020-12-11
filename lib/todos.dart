import 'package:flutter/cupertino.dart';
import 'package:todoapp/Model/Work.dart';
import 'package:todoapp/model/todo.dart';
import 'package:intl/intl.dart';

class TodosProvider extends ChangeNotifier {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  List<Todo> _Todos = [
    Todo(
        createdTime: DateTime.now(),
        title: 'Đánh răng ',
        description: '07:00 - 10/12/2020'),
    Todo(createdTime: DateTime.now(), title: 'Rửa mặt', description : '07:30 - 10/12/2020',
    )];


// List<Todo>get todos=>_Todos.where((todo)=>todo.isDone==false).toList();
  List<Todo> get todos => _Todos.where((todo) => todo.isDone == false).toList();
  List<Todo>get todoFinished=>_Todos.where((todo) =>todo.isDone==true).toList();
  void addTodo(Todo todo) {
    _Todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _Todos.remove(todo);
    notifyListeners();
  }
  void updateTodo(Todo todo, String title,String description){
    todo.title=title;
    todo.description=description;
    notifyListeners();
  }
  bool checkStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
}
