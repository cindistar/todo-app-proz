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
  //     title: 'Compras no shopping',
  //     subtitle: 'Comprinhas',
  //     description: 'Comprar roupas e pefume no shopping',
  //     isDone: false,
  //   ),
  // );

  //await httpClient.getTodosList();

  // await httpClient.updateTodo(TodoModel(
  // id: '6362a22875250203e82f3986',
  // title: 'Levar pet no vet',
  // subtitle: 'Aisha',
  // description: 'Dar vacina na gata',
  // isDone: false,
  // ));

  //await httpClient.deleteTodo('6361dc4875250203e82f3698');

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
