import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/todo_widget.dart';
import 'package:todoapp/todos.dart';
import 'package:provider/provider.dart';

class TodoListWiget extends StatefulWidget {
  @override
  _TodoListWigetState createState() => _TodoListWigetState();
}
class _TodoListWigetState extends State<TodoListWiget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    final todofinished = provider.todoFinished;
    return new Scaffold(
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Text('Todo Jod',style: new TextStyle(fontWeight: FontWeight.bold, fontSize:20 ), ),
            new Container(
              width: screenSize.width,
              height: screenSize.height/3,
              color: Colors.white,
              child: new ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoWidget(todo: todo);
                },
              ),
            ),
            new Text('Todo Finished' ,style: new TextStyle(fontWeight: FontWeight.bold, fontSize:20 ), ),
            new Container(
              width: screenSize.width,
              height: screenSize.height / 2,
              color: Colors.white,
              child: new ListView.builder(
                itemCount: todofinished.length,
                itemBuilder: (context, index) {
                  final todo = todofinished[index];
                  return TodoWidget(todo: todo);
                },
              ),
            )
          ],
        ),
        // child: new ListView.builder(
        //   itemCount: todos.length,
        //   itemBuilder: (context, index) {
        //     final todo = todos[index];
        //     return TodoWidget(todo: todo);
        //   },
        // ),
      ),
    );
  }
}

class  TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoWidget(todo: todo);
      },
    );
  }
}

//
// class _TodoListWigetState extends State<TodoListWiget> {
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery
//         .of(context)
//         .size;
//     final provider = Provider.of<TodosProvider>(context);
//
//     return Scaffold(
//
//         body: new Column(
//           children: [
//             Box1(),
//           ],
//         )
//
//     );
//   }
// }
//
// class Box1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<TodosProvider>(context);
//     final todos = provider.todos;
//     final screenSize = MediaQuery
//         .of(context)
//         .size;
//     return new Scaffold(
//       body: new Container(
//         child: new ListView.builder(
//           itemCount: todos.length,
//           itemBuilder: (context, index) {
//             final todo = todos[index];
//             return TodoWidget(todo: todo);
//           },
//         ),
//       ),
//     );
//   }
// }
