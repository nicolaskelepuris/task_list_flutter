import 'package:json_annotation/json_annotation.dart';
import 'package:task_list_app/infrastructure/dal/services/data/vessel.data.dart';

part 'get_vessel_info.response.g.dart';

@JsonSerializable()
class GetVesselInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetVesselInfoResponse({this.success, this.data, this.error});

  factory GetVesselInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVesselInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVesselInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  VesselData vessel;

  DataResponse({this.vessel});

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
