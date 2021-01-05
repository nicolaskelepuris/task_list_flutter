// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentData _$AppointmentDataFromJson(Map<String, dynamic> json) {
  return AppointmentData(
    id: json['id'] as int,
    type: json['type'] as int,
    vesselId: json['vesselId'] as int,
    vesselName: json['vesselName'] as String,
    duvNumber: json['duvNumber'] as String,
    scheduleNumber: json['scheduleNumber'] as String,
    voyageNumber: json['voyageNumber'] as String,
    nextPorts: json['nextPorts'] as String,
    operationType: json['operationType'] as int,
    cargo: json['cargo'] as String,
    port: json['port'] as int,
    hasCrewChange: json['hasCrewChange'] as bool,
    onSigners: json['onSigners'] as int,
    offSigners: json['offSigners'] as int,
    estimatedTimeOfArrivalOnFirstBrazillianPort:
        json['estimatedTimeOfArrivalOnFirstBrazillianPort'] == null
            ? null
            : DateTime.parse(
                json['estimatedTimeOfArrivalOnFirstBrazillianPort'] as String),
    estimatedTimeOfArrival: json['estimatedTimeOfArrival'] == null
        ? null
        : DateTime.parse(json['estimatedTimeOfArrival'] as String),
    estimatedTimeOfBerthing: json['estimatedTimeOfBerthing'] == null
        ? null
        : DateTime.parse(json['estimatedTimeOfBerthing'] as String),
    estimatedTimeOfSailing: json['estimatedTimeOfSailing'] == null
        ? null
        : DateTime.parse(json['estimatedTimeOfSailing'] as String),
    arrival: json['arrival'] == null
        ? null
        : DateTime.parse(json['arrival'] as String),
    berthing: json['berthing'] == null
        ? null
        : DateTime.parse(json['berthing'] as String),
    sailing: json['sailing'] == null
        ? null
        : DateTime.parse(json['sailing'] as String),
    status: json['status'] as int,
    tasks: (json['tasks'] as List)
        ?.map((e) => e == null ? null : TaskData.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppointmentDataToJson(AppointmentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'vesselId': instance.vesselId,
      'vesselName': instance.vesselName,
      'duvNumber': instance.duvNumber,
      'scheduleNumber': instance.scheduleNumber,
      'voyageNumber': instance.voyageNumber,
      'nextPorts': instance.nextPorts,
      'operationType': instance.operationType,
      'cargo': instance.cargo,
      'port': instance.port,
      'hasCrewChange': instance.hasCrewChange,
      'onSigners': instance.onSigners,
      'offSigners': instance.offSigners,
      'estimatedTimeOfArrivalOnFirstBrazillianPort': instance
          .estimatedTimeOfArrivalOnFirstBrazillianPort
          ?.toIso8601String(),
      'estimatedTimeOfArrival':
          instance.estimatedTimeOfArrival?.toIso8601String(),
      'estimatedTimeOfBerthing':
          instance.estimatedTimeOfBerthing?.toIso8601String(),
      'estimatedTimeOfSailing':
          instance.estimatedTimeOfSailing?.toIso8601String(),
      'arrival': instance.arrival?.toIso8601String(),
      'berthing': instance.berthing?.toIso8601String(),
      'sailing': instance.sailing?.toIso8601String(),
      'status': instance.status,
      'tasks': instance.tasks,
    };
