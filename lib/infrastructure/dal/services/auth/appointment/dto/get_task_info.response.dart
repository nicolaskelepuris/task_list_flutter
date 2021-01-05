import 'package:json_annotation/json_annotation.dart';
import 'package:task_list_app/infrastructure/dal/services/data/task.data.dart';

part 'get_task_info.response.g.dart';

@JsonSerializable()
class GetTaskInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetTaskInfoResponse({this.success, this.data, this.error});

  factory GetTaskInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTaskInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTaskInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  TaskData task;

  DataResponse({this.task});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  String message;

  ErrorResponse({this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
