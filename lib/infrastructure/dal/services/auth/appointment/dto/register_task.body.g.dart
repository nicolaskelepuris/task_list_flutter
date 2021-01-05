// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_task.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTaskBody _$RegisterTaskBodyFromJson(Map<String, dynamic> json) {
  return RegisterTaskBody(
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

Map<String, dynamic> _$RegisterTaskBodyToJson(RegisterTaskBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'deadline': instance.deadline?.toIso8601String(),
      'status': instance.status,
      'whenToComplete': instance.whenToComplete,
      'appointmentId': instance.appointmentId,
    };
