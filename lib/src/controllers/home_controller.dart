import 'package:api_flow/src/models/todo_model.dart';
import 'package:api_flow/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  late final TodoRepository _repository;

  HomeController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    todos = await _repository.fetchTodos();
  }
}
