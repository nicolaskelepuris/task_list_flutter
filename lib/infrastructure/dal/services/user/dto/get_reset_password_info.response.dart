import 'package:json_annotation/json_annotation.dart';

part 'get_reset_password_info.response.g.dart';

@JsonSerializable()
class GetResetPasswordInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetResetPasswordInfoResponse({this.success, this.data, this.error});

  factory GetResetPasswordInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResetPasswordInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetResetPasswordInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  String password;

  DataResponse({this.password});

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
