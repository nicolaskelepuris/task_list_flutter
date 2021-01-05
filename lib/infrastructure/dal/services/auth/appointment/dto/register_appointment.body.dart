import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_appointment.body.g.dart';

@JsonSerializable()
class RegisterAppointmentBody {
  final int type;
  final int vesselId;
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

  RegisterAppointmentBody({
    @required this.type,
    @required this.vesselId,
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
  });

  factory RegisterAppointmentBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterAppointmentBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAppointmentBodyToJson(this);
}
