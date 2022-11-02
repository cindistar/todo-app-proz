import 'package:proz_todo_app/data/model/todo_model.dart';

abstract class TodoRepository {

  Future<List<TodoModel>> getTodosList();

  Future<TodoModel> createTodo(TodoModel todoModel);

  Future<TodoModel> updateTodo(TodoModel todoModel);

  Future<void> deleteTodo(String todoId);
}
