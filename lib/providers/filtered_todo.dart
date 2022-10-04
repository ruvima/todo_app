import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/todo_filter.dart';
import 'package:todo_app/providers/todo_list.dart';
import 'package:todo_app/providers/todo_search.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;
  const FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredTodos: []);
  }

  @override
  List<Object> get props => [filteredTodos];

  @override
  bool get stringify => true;

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}

class FilteredTodos with ChangeNotifier {
  FilteredTodosState _state = FilteredTodosState.initial();
  FilteredTodosState get state => _state;

  void update(
    TodoFilter todoFilter,
    TodoSerch todoSerch,
    TodoList todoList,
  ) {
    List<Todo> _filteredTodos;

    switch (todoFilter.state.filter) {
      case Filter.active:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
        _filteredTodos = todoList.state.todos;
        break;
    }

    if (todoSerch.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(todoSerch.state.searchTerm))
          .toList();
    }

    _state = _state.copyWith(filteredTodos: _filteredTodos);
    notifyListeners();
  }
}
