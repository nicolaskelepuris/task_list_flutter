// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_appointments_info.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAppointmentsInfoResponse _$GetAppointmentsInfoResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppointmentsInfoResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] == null
        ? null
        : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetAppointmentsInfoResponseToJson(
        GetAppointmentsInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    appointments: (json['appointments'] as List)
        ?.map((e) => e == null ? null : AppointmentData.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'appointments': instance.appointments,
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
