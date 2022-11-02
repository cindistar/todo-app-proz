import 'dart:convert';

class TodoModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final bool isDone;

  TodoModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.isDone,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, subtitle: $subtitle, description: $description, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoModel &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.description == description &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        description.hashCode ^
        isDone.hashCode;
  }
}
