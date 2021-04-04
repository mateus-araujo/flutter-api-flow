import 'package:api_flow/src/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  late final Dio dio;
  static final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);

    return (response.data as List)
        .map((json) => TodoModel.fromJson(json))
        .toList();
  }
}
