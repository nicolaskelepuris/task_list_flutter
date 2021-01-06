import 'package:task_list_app/infrastructure/dal/services/data/user.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_users_info.response.g.dart';

@JsonSerializable()
class GetUsersInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetUsersInfoResponse({this.success, this.data, this.error});

  factory GetUsersInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUsersInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  List<UserData> users;

  DataResponse({this.users});

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
