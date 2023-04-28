import 'package:todo/models/todo.dart';

abstract class TodoListState {}

class TodoListLoadingState extends TodoListState {}

class TodoListEmptyState extends TodoListState {}

class TodoListLoadedState extends TodoListState {
  final List<Todo> todos;

  TodoListLoadedState(this.todos);
}

class TodoListErrorState extends TodoListState {
  final String errorText;

  TodoListErrorState(this.errorText);
}