import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_list_app/domain/core/constants/storage.constants.dart';
import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/domain/vessel/models/task.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/appointment/appointment.service.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/appointment/dto/register_appointment.body.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/appointment/dto/register_task.body.dart';
import 'package:task_list_app/infrastructure/dal/services/data/appointment.data.dart';
import 'package:task_list_app/infrastructure/dal/services/data/task.data.dart';

class AppointmentDomainRepository {
  final AppointmentService _appointmentService;
  final GetStorage _storage;
  const AppointmentDomainRepository({
    @required AppointmentService appointmentService,
    @required GetStorage storage,
  })  : _appointmentService = appointmentService,
        _storage = storage;

  Future<List<AppointmentData>> getAppointmentsInfo() async {
    try {
      var response = await _appointmentService.getAppointmentsInfo();
      if (response.success) {
        return response.data.appointments;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<AppointmentData> getAppointmentInfo({@required int id}) async {
    try {
      var response = await _appointmentService.getAppointmentInfo(id: id);
      if (response.success) {
        return response.data.appointment;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<AppointmentData> registerAppointment(
      {@required Appointment appointment}) async {
    try {
      var body = RegisterAppointmentBody(
        arrival: appointment.arrival.value,
        berthing: appointment.berthing.value,
        status: appointment.status.value.index,
        cargo: appointment.cargo.value,
        duvNumber: appointment.duvNumber.value,
        estimatedTimeOfArrival: appointment.estimatedTimeOfArrival.value,
        estimatedTimeOfArrivalOnFirstBrazillianPort:
            appointment.estimatedTimeOfArrivalOnFirstBrazillianPort.value,
        estimatedTimeOfBerthing: appointment.estimatedTimeOfBerthing.value,
        estimatedTimeOfSailing: appointment.estimatedTimeOfSailing.value,
        hasCrewChange: appointment.hasCrewChange.value,
        nextPorts: appointment.nextPorts.value,
        offSigners: appointment.offSigners.value,
        onSigners: appointment.onSigners.value,
        operationType: appointment.operationType.value.index,
        port: appointment.port.value.index,
        sailing: appointment.sailing.value,
        scheduleNumber: appointment.scheduleNumber.value,
        type: appointment.type.value.index,
        vesselId: appointment.vesselId.value,
        voyageNumber: appointment.voyageNumber.value,
      );

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _appointmentService.registerAppointment(body, token);

      if (response.success) {
        return response.data.appointment;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<AppointmentData> updateAppointment(
      {@required Appointment appointment}) async {
    try {
      var body = RegisterAppointmentBody(
        arrival: appointment.arrival.value,
        berthing: appointment.berthing.value,
        status: appointment.status.value.index,
        cargo: appointment.cargo.value,
        duvNumber: appointment.duvNumber.value,
        estimatedTimeOfArrival: appointment.estimatedTimeOfArrival.value,
        estimatedTimeOfArrivalOnFirstBrazillianPort:
            appointment.estimatedTimeOfArrivalOnFirstBrazillianPort.value,
        estimatedTimeOfBerthing: appointment.estimatedTimeOfBerthing.value,
        estimatedTimeOfSailing: appointment.estimatedTimeOfSailing.value,
        hasCrewChange: appointment.hasCrewChange.value,
        nextPorts: appointment.nextPorts.value,
        offSigners: appointment.offSigners.value,
        onSigners: appointment.onSigners.value,
        operationType: appointment.operationType.value.index,
        port: appointment.port.value.index,
        sailing: appointment.sailing.value,
        scheduleNumber: appointment.scheduleNumber.value,
        type: appointment.type.value.index,
        vesselId: appointment.vesselId.value,
        voyageNumber: appointment.voyageNumber.value,
      );

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _appointmentService.updateAppointment(
          body: body, token: token, id: appointment.id.value);

      if (response.success) {
        return response.data.appointment;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<TaskData> registerTask({@required Task task}) async {
    try {
      var body = RegisterTaskBody(
        name: task.name.value,
        description: task.description.value,
        deadline: task.deadline.value,
        status: task.status.value.index,
        whenToComplete: task.whenToComplete.value.index,
        appointmentId: task.appointmentId.value,
      );

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _appointmentService.registerTask(body, token);

      if (response.success) {
        return response.data.task;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<TaskData> updateTask({@required Task task}) async {
    try {
      var body = RegisterTaskBody(
        name: task.name.value,
        description: task.description.value,
        deadline: task.deadline.value,
        status: task.status.value.index,
        whenToComplete: task.whenToComplete.value.index,
        appointmentId: task.appointmentId.value,
      );

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _appointmentService.updateTask(
          body: body, token: token, id: task.id.value);

      if (response.success) {
        return response.data.task;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<TaskData> getTaskInfo({@required int id}) async {
    try {
      var response = await _appointmentService.getTaskInfo(id: id);
      if (response.success) {
        return response.data.task;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }
}
