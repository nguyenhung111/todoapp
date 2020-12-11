import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/todos.dart';


import 'counter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    ),
  );
}

//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<CounterModel>(
//             create: (context) => CounterModel()),
//       ],
//       child: MaterialApp(
//         home: HomePage(),
//       ),
//     );
//   }
// }
