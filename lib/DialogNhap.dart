import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/todo_form_widgegt.dart';
import 'package:todoapp/todos.dart';
import 'package:provider/provider.dart';

class DialogNhap extends StatefulWidget {
  @override
  _DialogNhapState createState() => _DialogNhapState();
}

class _DialogNhapState extends State<DialogNhap> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) =>
      AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todo Job',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 8),
              TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: addTodo,
              )
            ],
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(title: title, description: description);
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}

// class DialogNhap extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       elevation: 0,
//       backgroundColor: Colors.white,
//       child: _buildChild(context),
//     );
//   }
//
//   _buildChild(BuildContext context) => Scaffold(
//     body: new ListView(
//       children: [
//         new Text(
//           "Todo Job",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//         ),
//         new TextFormField(
//           decoration: InputDecoration(
//               border: OutlineInputBorder(
//                   borderRadius:
//                   const BorderRadius.all(Radius.circular(20))),
//               hintStyle: TextStyle(fontSize: 400),
//               labelText: 'Job title'),
//         ),
//         new TextFormField(
//           decoration: InputDecoration(
//               border: OutlineInputBorder(
//                   borderRadius:
//                   const BorderRadius.all(Radius.circular(20))),
//               hintStyle: TextStyle(fontSize: 400),
//               labelText: 'Date'),
//         ),
//       ],
//     ),
//   );
// }
