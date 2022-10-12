import 'dart:convert';

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
      );

  factory Task.empty() => Task(
        id: 0,
        name: '',
        description: '',
      );

  final int id;
  final String name;
  final String description;

  Task copyWith({
    int? id,
    String? name,
    String? description,
  }) =>
      Task(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
