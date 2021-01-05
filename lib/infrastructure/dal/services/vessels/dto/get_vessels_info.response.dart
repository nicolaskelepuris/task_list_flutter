import 'package:json_annotation/json_annotation.dart';
import 'package:task_list_app/infrastructure/dal/services/data/vessel.data.dart';

part 'get_vessels_info.response.g.dart';

@JsonSerializable()
class GetVesselsInfoResponse {
  bool success;
  DataResponse data;
  ErrorResponse error;

  GetVesselsInfoResponse({this.success, this.data, this.error});

  factory GetVesselsInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVesselsInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVesselsInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  List<VesselData> vessels;

  DataResponse({this.vessels});

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
