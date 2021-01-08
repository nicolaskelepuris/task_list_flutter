import 'package:json_annotation/json_annotation.dart';

part 'delete_user.response.g.dart';

@JsonSerializable()
class DeleteUserResponse {
  bool success;
  String data;
  ErrorResponse error;

  DeleteUserResponse({this.success, this.error});

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserResponseToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  String message;

  ErrorResponse({this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
