import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(name: 'content')
  final String title;
  final String description;
  final int priority;
  @JsonKey(name: 'due', fromJson: _dueDateFromJson)
  final DateTime? dueDate;

  const Todo({
    required this.title,
    required this.description,
    required this.priority,
    this.dueDate,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

DateTime? _dueDateFromJson(Map<String, dynamic>? json) {
  return json == null ? null : DateTime.parse(json['date']);

  if (json == null) {
    return null;
  }

  return DateTime.parse(json['date']);
}
