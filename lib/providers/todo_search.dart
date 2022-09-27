import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  @override
  List<Object> get props => [searchTerm];
  const TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }

  @override
  bool get stringify => true;

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

class TodoSerch with ChangeNotifier {
  TodoSearchState _state = TodoSearchState.initial();
  TodoSearchState get state => _state;
  void setSearchTerm(String newSearchTerm) {
    _state = _state.copyWith(searchTerm: newSearchTerm);
    notifyListeners();
  }
}
