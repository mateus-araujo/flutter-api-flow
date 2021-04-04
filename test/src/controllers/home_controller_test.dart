import 'package:api_flow/src/controllers/home_controller.dart';
import 'package:api_flow/src/models/todo_model.dart';
import 'package:api_flow/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);

  test('should fill todos list', () async {
    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);

    expect(controller.todos.isNotEmpty, true);
  });

  test('should change state to error if request fails', () async {
    when(() => repository.fetchTodos()).thenThrow(Exception());

    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}
