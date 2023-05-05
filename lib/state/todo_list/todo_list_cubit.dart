import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/state/todo_list/todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final _todoProvider = TodoProvider();

  TodoListCubit() : super(TodoListLoadingState()) {
    _load();
  }

  void _load() async {
    try {
      final todos = await _todoProvider.getAllTodos();

      if (todos.isEmpty) {
        emit(TodoListEmptyState());
        return;
      }

      emit(TodoListLoadedState(todos));
    } catch (e, stack) {
      // print(e);
      // print(stack);
      emit(TodoListErrorState('Error'));
      rethrow;
    }
  }
}
