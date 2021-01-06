// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_info.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersInfoResponse _$GetUsersInfoResponseFromJson(Map<String, dynamic> json) {
  return GetUsersInfoResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetUsersInfoResponseToJson(
        GetUsersInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    users: (json['users'] as List)
        ?.map((e) => e == null ? null : UserData.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
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
