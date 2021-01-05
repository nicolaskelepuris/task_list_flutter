import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_vessel.body.g.dart';

@JsonSerializable()
class RegisterVesselBody {
  String name;
  String imo;
  String flag;
  double deadweight;
  double lengthOverall;
  double beam;
  double depth;

  RegisterVesselBody({
    @required String name,
    @required String imo,
    @required String flag,
    @required this.deadweight,
    @required this.lengthOverall,
    @required this.beam,
    @required this.depth,
  }) {
    this.name = name.trim();
    this.imo = imo.trim();
    this.flag = flag.trim();
  }

  factory RegisterVesselBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterVesselBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterVesselBodyToJson(this);
}
