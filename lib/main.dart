import 'package:flutter/material.dart';
import 'package:todo_app/pages/todos_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TodosPages(),
    );
  }
}
