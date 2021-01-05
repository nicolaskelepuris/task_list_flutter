import 'package:task_list_app/infrastructure/dal/services/data/user.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_info.response.g.dart';

@JsonSerializable()
class GetUserInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetUserInfoResponse({this.success, this.data, this.error});

  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  UserData user;

  DataResponse({this.user});

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
