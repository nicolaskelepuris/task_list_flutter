import 'package:json_annotation/json_annotation.dart';
import 'package:task_list_app/infrastructure/dal/services/data/appointment.data.dart';

part 'get_appointments_info.response.g.dart';

@JsonSerializable()
class GetAppointmentsInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetAppointmentsInfoResponse({this.success, this.data, this.error});

  factory GetAppointmentsInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppointmentsInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAppointmentsInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  List<AppointmentData> appointments;

  DataResponse({this.appointments});

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
