// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) {
  return DeleteUserResponse(
    success: json['success'] as bool,
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  )..data = json['data'] as String;
}

Map<String, dynamic> _$DeleteUserResponseToJson(DeleteUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
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
