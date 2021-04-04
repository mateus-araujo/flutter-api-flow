import 'package:api_flow/src/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  late final Dio dio;
  static final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);

    final list = (response.data as List)
        .map((item) => TodoModel.fromJson(item))
        .toList();

    return list;
  }
}
