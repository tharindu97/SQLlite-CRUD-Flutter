import 'package:flutter/material.dart';
import 'package:todoAppList/screens/todo.list.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: TodoListScreen(),
    );
  }
}

