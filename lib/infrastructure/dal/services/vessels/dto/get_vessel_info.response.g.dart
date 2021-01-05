// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vessel_info.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVesselInfoResponse _$GetVesselInfoResponseFromJson(
    Map<String, dynamic> json) {
  return GetVesselInfoResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetVesselInfoResponseToJson(
        GetVesselInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    vessel: json['vessel'] == null ? null : VesselData.fromJson(json['vessel']),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'vessel': instance.vessel,
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
