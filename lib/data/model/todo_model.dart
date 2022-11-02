import 'dart:convert';

class TodoModel {
  TodoModel({
    this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.isDone,
  });

  String? id;
  final String title;
  final String subtitle;
  final String description;
  final bool isDone;

  TodoModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    bool? isDone,
  }) =>
      TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
      );

  factory TodoModel.fromJson(String str) => TodoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
        id: json["_id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        isDone: json["isDone"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "isDone": isDone,
      };

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, subtitle: $subtitle, description: $description, isDone: $isDone)';
  }
}
