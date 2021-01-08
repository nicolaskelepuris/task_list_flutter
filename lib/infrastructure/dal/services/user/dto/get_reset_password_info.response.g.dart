// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reset_password_info.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetResetPasswordInfoResponse _$GetResetPasswordInfoResponseFromJson(
    Map<String, dynamic> json) {
  return GetResetPasswordInfoResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetResetPasswordInfoResponseToJson(
        GetResetPasswordInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
