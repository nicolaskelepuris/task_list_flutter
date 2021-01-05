import 'package:json_annotation/json_annotation.dart';
import 'package:task_list_app/infrastructure/dal/services/data/appointment.data.dart';

part 'get_appointment_info.response.g.dart';

@JsonSerializable()
class GetAppointmentInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetAppointmentInfoResponse({this.success, this.data, this.error});

  factory GetAppointmentInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppointmentInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAppointmentInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  AppointmentData appointment;

  DataResponse({this.appointment});

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
