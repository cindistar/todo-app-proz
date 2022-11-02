import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proz_todo_app/data/model/todo_model.dart';
import 'package:proz_todo_app/data/repositories/todo_repository_impl.dart';
import 'package:proz_todo_app/view/todo_view.dart';

void main() async {
  final Dio dio = Dio();
  final httpClient = TodoRepositoryImpl(dio);

  // await httpClient.createTodo(
  //   TodoModel(
  //     id: '04',
  //     title: 'Projeto Karatê',
  //     subtitle: 'Lutar karatê',
  //     description: 'Fazer aulas de karatê',
  //     isDone: false,
  //   ),
  // );

  //await httpClient.getTodosList();

  // await httpClient.updateTodo(TodoModel(
  // id: '04',
  // title: 'Natação',
  // subtitle: 'Nadar',
  // description: 'Fazer aulas de natação',
  // isDone: false,
  // ));

  //await httpClient.deleteTodo('6361d17e75250203e82f3679');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoView(),
    );
  }
}
