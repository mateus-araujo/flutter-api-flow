import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  print(stringToInt('d'));
}

int stringToInt(String text) {
  int value;
  try {
    value = int.parse(text);
  } catch (error) {
    throw Exception('text ($text) is not a number');
  }

  return value;
}

Future<Todo> fetch() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  final response = await http.get(url);

  final json = jsonDecode(response.body);
  final todo = Todo.fromMap(json);
  return todo;
}

class Todo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo(
      {required this.title,
      required this.id,
      required this.userId,
      required this.completed});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'userId': userId,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      id: map['id'],
      userId: map['userId'],
      completed: map['completed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
