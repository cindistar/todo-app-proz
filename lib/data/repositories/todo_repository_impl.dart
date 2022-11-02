import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:proz_todo_app/data/model/todo_model.dart';
import 'package:proz_todo_app/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final Dio _dio;

  TodoRepositoryImpl(this._dio);

  final _baseUrl = 'https://crudcrud.com/api/d672547ec04644fd883bed629fe9a49a';

  @override
  Future<List<TodoModel>> getTodosList() async {
    final Response response = await _dio.get(
      '$_baseUrl/todos',
    );
    final list = List.from(response.data);
    final result = list.map((e) => TodoModel.fromMap(e)).toList();
    log('result $result');
    return result;
  }

  @override
  Future<TodoModel> createTodo(TodoModel todoModel) async {
    final Response response = await _dio.post(
      '$_baseUrl/todos',
      data: todoModel.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      ),
    );
    log('create $response');
    final todos = TodoModel.fromMap(response.data);
    return todos;
  }

  @override
  Future<TodoModel> updateTodo(TodoModel todoModel) async {
    final Response response = await _dio.put(
      '$_baseUrl/todos/${todoModel.id}',
      data: {
        'title': todoModel.title,
        'subtitle': todoModel.subtitle,
        'description': todoModel.description,
        'isDone': todoModel.isDone,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      ),
    );
    log('update create $response');
    return TodoModel.fromJson(response.data);
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    final response = await _dio.delete(
      '$_baseUrl/todos/$todoId',
      options: Options(
        headers: <String, String>{'Content-Type': 'text/plain'},
      ),
    );
    log('delete $response');
  }
}
