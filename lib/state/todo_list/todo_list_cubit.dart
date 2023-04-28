import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/state/todo_list/todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListLoadingState()) {
    _load();
  }

  void _load() {
    emit(TodoListEmptyState());
  }
}
