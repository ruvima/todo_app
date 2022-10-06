import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/todo_list.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountState.intial() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;
  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}

class ActiveTodoCount with ChangeNotifier {
  // ActiveTodoCountState _state = ActiveTodoCountState.intial();
  late ActiveTodoCountState _state;
  final int initialActiveTodocount;
  ActiveTodoCount({
    required this.initialActiveTodocount,
  }) {
    _state = ActiveTodoCountState(activeTodoCount: initialActiveTodocount);
  }

  ActiveTodoCountState get state => _state;

  void update(TodoList todoList) {
    final int newActiveTodoCount = todoList.state.todos
        .where((Todo todo) => !todo.completed)
        .toList()
        .length;

    _state = _state.copyWith(activeTodoCount: newActiveTodoCount);
    notifyListeners();
  }
}
