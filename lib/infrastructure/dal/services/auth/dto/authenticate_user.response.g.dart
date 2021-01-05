// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_user.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateUserResponse _$AuthenticateUserResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticateUserResponse(
    success: json['success'] as bool,
    data: json['data'] == null ? null : DataResponse.fromJson(json['data']),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthenticateUserResponseToJson(
        AuthenticateUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    user: json['user'] == null ? null : UserData.fromJson(json['user']),
    token: json['token'] == null ? null : TokenData.fromJson(json['token']),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
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
