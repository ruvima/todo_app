import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/todos_pages.dart';
import 'package:todo_app/providers/active_todo_count.dart';
import 'package:todo_app/providers/filtered_todo.dart';
import 'package:todo_app/providers/todo_filter.dart';
import 'package:todo_app/providers/todo_list.dart';
import 'package:todo_app/providers/todo_search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(
          create: (context) => TodoFilter(),
        ),
        ChangeNotifierProvider<TodoSearch>(
          create: (context) => TodoSearch(),
        ),
        ChangeNotifierProvider<TodoList>(
          create: (context) => TodoList(),
        ),
        ProxyProvider<TodoList, ActiveTodoCount>(
          update: (
            BuildContext context,
            TodoList todoList,
            ActiveTodoCount? _,
          ) =>
              ActiveTodoCount(todoList: todoList),
        ),
        ProxyProvider3<TodoFilter, TodoSearch, TodoList, FilteredTodos>(
          update: (
            BuildContext context,
            TodoFilter todoFilter,
            TodoSearch todoSearch,
            TodoList todoList,
            FilteredTodos? _,
          ) =>
              FilteredTodos(
                  todoFilter: todoFilter,
                  todoSearch: todoSearch,
                  todoList: todoList),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const TodosPages(),
      ),
    );
  }
}
