import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodoService {
  final String token;
  final String baseUrl = 'http://127.0.0.1:8000/api';

  TodoService(this.token);

  Future<List<Todo>> getTodos() async {
    final response = await http.get(
      Uri.parse('$baseUrl/todos'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<void> addTodo(String title, String description) async {
    final response = await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'title': title,
        'description': description,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add todo');
    }
  }

  Future<void> updateTodo(
      int id, String title, String description, bool isCompleted) async {
    final response = await http.put(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'title': title,
        'description': description,
        'is_completed': isCompleted,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodo(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }
}
