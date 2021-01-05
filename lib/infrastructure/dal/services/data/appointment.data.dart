import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:task_list_app/infrastructure/dal/services/data/task.data.dart';

part 'appointment.data.g.dart';

@JsonSerializable()
class AppointmentData {
  final int id;
  final int type;
  final int vesselId;
  final String vesselName;
  final String duvNumber, scheduleNumber, voyageNumber;
  final String nextPorts;
  final int operationType;
  final String cargo;
  final int port;
  final bool hasCrewChange;
  final int onSigners, offSigners;
  final DateTime estimatedTimeOfArrivalOnFirstBrazillianPort;
  final DateTime estimatedTimeOfArrival;
  final DateTime estimatedTimeOfBerthing;
  final DateTime estimatedTimeOfSailing;
  final DateTime arrival;
  final DateTime berthing;
  final DateTime sailing;
  final int status;
  final List<TaskData> tasks;

  AppointmentData({
    @required this.id,
    @required this.type,
    @required this.vesselId,
    @required this.vesselName,
    @required this.duvNumber,
    @required this.scheduleNumber,
    @required this.voyageNumber,
    @required this.nextPorts,
    @required this.operationType,
    @required this.cargo,
    @required this.port,
    @required this.hasCrewChange,
    @required this.onSigners,
    @required this.offSigners,
    @required this.estimatedTimeOfArrivalOnFirstBrazillianPort,
    @required this.estimatedTimeOfArrival,
    @required this.estimatedTimeOfBerthing,
    @required this.estimatedTimeOfSailing,
    @required this.arrival,
    @required this.berthing,
    @required this.sailing,
    @required this.status,
    @required this.tasks,
  });

  factory AppointmentData.fromJson(json) => _$AppointmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDataToJson(this);
}
