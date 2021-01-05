import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vessel.data.g.dart';

@JsonSerializable()
class VesselData {
  final int id;
  final String name, imo, flag;
  final double deadweight, lengthOverall, beam, depth;

  VesselData({
    @required this.id,
    @required this.name,
    @required this.imo,
    @required this.flag,
    @required this.deadweight,
    @required this.lengthOverall,
    @required this.beam,
    @required this.depth,
  });

  VesselData.fromVesselData({@required VesselData vesselData})
      : this.id = vesselData.id,
        this.name = vesselData.name,
        this.imo = vesselData.imo,
        this.flag = vesselData.flag,
        this.deadweight = vesselData.deadweight,
        this.lengthOverall = vesselData.lengthOverall,
        this.beam = vesselData.beam,
        this.depth = vesselData.depth;

  factory VesselData.fromJson(json) => _$VesselDataFromJson(json);

  Map<String, dynamic> toJson() => _$VesselDataToJson(this);
}
