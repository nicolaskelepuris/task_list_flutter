// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_appointment_info.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAppointmentInfoResponse _$GetAppointmentInfoResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppointmentInfoResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetAppointmentInfoResponseToJson(
        GetAppointmentInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    appointment: json['appointment'] == null
        ? null
        : AppointmentData.fromJson(json['appointment']),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'appointment': instance.appointment,
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
