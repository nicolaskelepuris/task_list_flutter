// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vessel.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VesselData _$VesselDataFromJson(Map<String, dynamic> json) {
  return VesselData(
    id: json['id'] as int,
    name: json['name'] as String,
    imo: json['imo'] as String,
    flag: json['flag'] as String,
    deadweight: (json['deadweight'] as num)?.toDouble(),
    lengthOverall: (json['lengthOverall'] as num)?.toDouble(),
    beam: (json['beam'] as num)?.toDouble(),
    depth: (json['depth'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$VesselDataToJson(VesselData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imo': instance.imo,
      'flag': instance.flag,
      'deadweight': instance.deadweight,
      'lengthOverall': instance.lengthOverall,
      'beam': instance.beam,
      'depth': instance.depth,
    };
