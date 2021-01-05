// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vessels_info.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVesselsInfoResponse _$GetVesselsInfoResponseFromJson(
    Map<String, dynamic> json) {
  return GetVesselsInfoResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetVesselsInfoResponseToJson(
        GetVesselsInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    vessels: (json['vessels'] as List)
        ?.map((e) => e == null ? null : VesselData.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'vessels': instance.vessels,
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
