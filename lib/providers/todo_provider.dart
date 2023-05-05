import 'package:dio/dio.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item.dart';

class TodoProvider {
  final _http = Dio(BaseOptions(
    baseUrl: 'https://api.todoist.com/rest/v2',
    headers: {
      'Authorization': ''
    }
  ));

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
}