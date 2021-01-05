import 'package:get/get.dart';
import 'package:task_list_app/domain/core/enums/appointment_status.dart';
import 'package:task_list_app/domain/core/enums/appointment_type.dart';
import 'package:task_list_app/domain/core/enums/operation_type.dart';
import 'package:task_list_app/domain/core/enums/port.dart';
import 'package:task_list_app/domain/core/utils/enum.util.dart';
import 'package:task_list_app/domain/vessel/models/task.dart';
import 'package:task_list_app/infrastructure/dal/services/data/appointment.data.dart';

class Appointment {
  RxInt id;
  Rx<AppointmentType> type;
  RxInt vesselId;
  RxString vesselName;
  RxString duvNumber, scheduleNumber, voyageNumber;
  RxString nextPorts;
  Rx<OperationType> operationType;
  RxString cargo;
  Rx<Port> port;
  RxBool hasCrewChange;
  RxInt onSigners, offSigners;
  Rx<DateTime> estimatedTimeOfArrivalOnFirstBrazillianPort;
  Rx<DateTime> estimatedTimeOfArrival;
  Rx<DateTime> estimatedTimeOfBerthing;
  Rx<DateTime> estimatedTimeOfSailing;
  Rx<DateTime> arrival;
  Rx<DateTime> berthing;
  Rx<DateTime> sailing;
  Rx<AppointmentStatus> status;
  RxList<Task> tasks;

  Appointment({
    this.id,
    this.type,
    this.vesselId,
    this.vesselName,
    this.duvNumber,
    this.scheduleNumber,
    this.voyageNumber,
    this.nextPorts,
    this.operationType,
    this.cargo,
    this.port,
    this.hasCrewChange,
    this.onSigners,
    this.offSigners,
    this.estimatedTimeOfArrivalOnFirstBrazillianPort,
    this.estimatedTimeOfArrival,
    this.estimatedTimeOfBerthing,
    this.estimatedTimeOfSailing,
    this.arrival,
    this.berthing,
    this.sailing,
    this.status,
    this.tasks,
  });

  factory Appointment.fromData({AppointmentData data}) {
    return Appointment(
      id: data.id.obs,
      type: AppointmentType.values[data.type].obs,
      vesselId: data.vesselId.obs,
      vesselName: data.vesselName.obs,
      duvNumber: data.duvNumber.obs,
      scheduleNumber: data.scheduleNumber.obs,
      voyageNumber: data.voyageNumber.obs,
      nextPorts: data.nextPorts.obs,
      operationType: OperationType.values[data.operationType].obs,
      cargo: data.cargo.obs,
      port: Port.values[data.port].obs,
      hasCrewChange: data.hasCrewChange.obs,
      onSigners: data.onSigners.obs,
      offSigners: data.offSigners.obs,
      estimatedTimeOfArrivalOnFirstBrazillianPort:
          data.estimatedTimeOfArrivalOnFirstBrazillianPort.obs,
      estimatedTimeOfArrival: data.estimatedTimeOfArrival.obs,
      estimatedTimeOfBerthing: data.estimatedTimeOfBerthing.obs,
      estimatedTimeOfSailing: data.estimatedTimeOfSailing.obs,
      arrival: data.arrival.obs,
      berthing: data.berthing.obs,
      sailing: data.sailing.obs,
      status: AppointmentStatus.values[data.status].obs,
      tasks: data.tasks.map((e) => Task.fromData(data: e)).toList().obs,
    );
  }

  factory Appointment.blank() {
    return Appointment(
      hasCrewChange: false.obs,
      estimatedTimeOfArrivalOnFirstBrazillianPort: DateTime.utc(1970, 1, 1).obs,
      estimatedTimeOfArrival: DateTime.utc(1970, 1, 1).obs,
      estimatedTimeOfBerthing: DateTime.utc(1970, 1, 1).obs,
      estimatedTimeOfSailing: DateTime.utc(1970, 1, 1).obs,
      arrival: DateTime.utc(1970, 1, 1).obs,
      berthing: DateTime.utc(1970, 1, 1).obs,
      sailing: DateTime.utc(1970, 1, 1).obs,
      duvNumber: ''.obs,
      scheduleNumber: ''.obs,
      voyageNumber: ''.obs,
      nextPorts: ''.obs,
      cargo: ''.obs,
      onSigners: 0.obs,
      offSigners: 0.obs,
      type: Rx<AppointmentType>(AppointmentType.consigneeAgent),
      operationType: Rx<OperationType>(),
      port: Rx<Port>(),
      status: Rx<AppointmentStatus>(AppointmentStatus.inProgress),
      vesselId: RxInt(),
      tasks: <Task>[].obs,
    );
  }

  Appointment clone() {
    return Appointment(
      id: id?.value?.obs,
      type: type?.value?.obs ?? Rx<AppointmentType>(),
      vesselId: vesselId?.value?.obs,
      vesselName: vesselName?.value?.obs,
      duvNumber: duvNumber?.value?.obs,
      scheduleNumber: scheduleNumber?.value?.obs,
      voyageNumber: voyageNumber?.value?.obs,
      nextPorts: nextPorts?.value?.obs,
      operationType: operationType?.value?.obs ?? Rx<OperationType>(),
      cargo: cargo?.value?.obs,
      port: port?.value?.obs ?? Rx<Port>(),
      hasCrewChange: hasCrewChange?.value?.obs,
      onSigners: onSigners?.value?.obs,
      offSigners: offSigners?.value?.obs,
      estimatedTimeOfArrivalOnFirstBrazillianPort:
          estimatedTimeOfArrivalOnFirstBrazillianPort?.value?.obs,
      estimatedTimeOfArrival: estimatedTimeOfArrival?.value?.obs,
      estimatedTimeOfBerthing: estimatedTimeOfBerthing?.value?.obs,
      estimatedTimeOfSailing: estimatedTimeOfSailing?.value?.obs,
      arrival: arrival?.value?.obs,
      berthing: berthing?.value?.obs,
      sailing: sailing?.value?.obs,
      status: status?.value?.obs ?? Rx<AppointmentStatus>(),
      tasks: tasks?.map((element) => element)?.toList()?.obs ?? <Task>[].obs,
    );
  }

  String get appointmentType =>
      EnumUtil.appointmentTypeToString(this.type.value);
  String get appointmentPort =>
      EnumUtil.appointmentPortToString(this.port.value);
  String get appointmentOperation =>
      EnumUtil.appointmentOperationTypeToString(this.operationType.value);
}
