import 'package:dio/dio.dart';
import 'package:todo/models/todo.dart';

class TodoProvider {
  final _http = Dio(BaseOptions(
      baseUrl: 'https://api.todoist.com/rest/v2',
      headers: {'Authorization': 'Bearer 4d6f27e51014ce83ca2b1d678527f4351bdd07b7'}));

  TodoProvider() {
    _http.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      responseHeader: true,
      requestHeader: true,
    ));
  }

  Future<List<Todo>> getAllTodos() async {
    final response = await _http.get<List>('/tasks');
    return response.data?.map((todoJson) => Todo.fromJson(todoJson)).toList() ?? [];
  }

  Future<Todo> createNewTodo({
    required String title,
    String? description,
    int? priority,
    DateTime? dueDate,
  }) async {
    final response = await _http.post(
      '/tasks',
      data: {
        'content': title,
        'description': description,
        'priority': priority,
        if (dueDate != null) 'due_datetime': dueDate.toString(),
      },
    );

    return Todo.fromJson(response.data);
  }

  Future<void> completeTodo(String id) async {
    await _http.post('/tasks/$id/close');
  }

  Future<void> deleteTodo(String id) async {
    await _http.delete('/tasks/$id');
  }
}
