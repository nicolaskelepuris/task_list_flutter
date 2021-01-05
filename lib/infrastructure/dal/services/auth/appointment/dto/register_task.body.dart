import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_task.body.g.dart';

@JsonSerializable()
class RegisterTaskBody {
  String name;
  String description;
  DateTime deadline;
  int status;
  int whenToComplete;
  int appointmentId;

  RegisterTaskBody({
    @required this.name,
    @required this.description,
    @required this.deadline,
    @required this.status,
    @required this.whenToComplete,
    @required this.appointmentId,
  });

  factory RegisterTaskBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterTaskBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterTaskBodyToJson(this);
}
