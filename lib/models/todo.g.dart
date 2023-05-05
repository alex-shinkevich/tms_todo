// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      title: json['content'] as String,
      description: json['description'] as String,
      priority: json['priority'] as int,
      dueDate: _dueDateFromJson(json['due'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'content': instance.title,
      'description': instance.description,
      'priority': instance.priority,
      'due': instance.dueDate?.toIso8601String(),
    };
