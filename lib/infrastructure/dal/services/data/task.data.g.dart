// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskData _$TaskDataFromJson(Map<String, dynamic> json) {
  return TaskData(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    deadline: json['deadline'] == null
        ? null
        : DateTime.parse(json['deadline'] as String),
    status: json['status'] as int,
    whenToComplete: json['whenToComplete'] as int,
    appointmentId: json['appointmentId'] as int,
  );
}

Map<String, dynamic> _$TaskDataToJson(TaskData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'deadline': instance.deadline?.toIso8601String(),
      'status': instance.status,
      'whenToComplete': instance.whenToComplete,
      'appointmentId': instance.appointmentId,
    };
