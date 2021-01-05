import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.data.g.dart';

@JsonSerializable()
class TaskData {
  int id;
  String name;
  String description;
  DateTime deadline;
  int status;
  int whenToComplete;
  int appointmentId;

  TaskData({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.deadline,
    @required this.status,
    @required this.whenToComplete,
    @required this.appointmentId
  });

  factory TaskData.fromJson(json) => _$TaskDataFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDataToJson(this);
}
