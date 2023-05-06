import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/state/todo_list/todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final _todoProvider = TodoProvider();

  TodoListCubit() : super(TodoListLoadingState()) {
    load();
  }

  void _completeLoading(List<Todo> todos) {
    if (todos.isEmpty) {
      emit(TodoListEmptyState());
      return;
    }

    emit(TodoListLoadedState(todos));
  }

  Future<void> load() async {
    try {
      final todos = await _todoProvider.getAllTodos();
      _completeLoading(todos);
    } catch (e, stack) {
      // print(e);
      // print(stack);
      emit(TodoListErrorState('Error'));
      rethrow;
    }
  }

  void createNewTodo({
    required String title,
    String? description,
    String? priority,
    String? dueDate,
  }) async {
    final todo = await _todoProvider.createNewTodo(
      title: title,
      description: description,
      priority: priority == null ? null : int.tryParse(priority),
      dueDate: dueDate == null ? null : DateTime.tryParse(dueDate),
    );

    emit(TodoListLoadedState([
      if (state is TodoListLoadedState) ...(state as TodoListLoadedState).todos,
      todo,
    ]));
  }

  void completeTodo(String id) async {
    _todoProvider.completeTodo(id);

    if (state is TodoListLoadedState) {
      final todos = (state as TodoListLoadedState).todos.where((todo) => todo.id != id).toList();
      _completeLoading(todos);
    }
  }

  void deleteTodo(String id) async {
    await _todoProvider.deleteTodo(id);

    if (state is TodoListLoadedState) {
      final todos = (state as TodoListLoadedState).todos.where((todo) => todo.id != id).toList();
      _completeLoading(todos);
    }
  }
}
