import 'package:flutter/foundation.dart';
import 'package:task_list_app/domain/appointment/appointment.domain.repository.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/domain/vessel/models/task.dart';

class AppointmentDomainService {
  final AppointmentDomainRepository _repository;
  const AppointmentDomainService({
    @required AppointmentDomainRepository repository,
  }) : _repository = repository;

  Future<List<Appointment>> getAppointmentsInfo() async {
    try {
      var appointments = await _repository.getAppointmentsInfo();

      return appointments.map((e) => Appointment.fromData(data: e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<Appointment> getAppointmentInfo({@required int id}) async {
    try {
      var appointment = await _repository.getAppointmentInfo(id: id);

      return Appointment.fromData(data: appointment);
    } catch (err) {
      rethrow;
    }
  }

  Future<Appointment> registerAppointment(
      {@required Appointment appointment}) async {
    try {
      var appointmentReceived =
          await _repository.registerAppointment(appointment: appointment);

      return Appointment.fromData(data: appointmentReceived);
    } catch (err) {
      rethrow;
    }
  }

  Future<Appointment> updateAppointment(
      {@required Appointment appointment}) async {
    try {
      var appointmentReceived =
          await _repository.updateAppointment(appointment: appointment);

      return Appointment.fromData(data: appointmentReceived);
    } catch (err) {
      rethrow;
    }
  }

  Future<Task> registerTask({@required Task task}) async {
    try {
      var taskReceived = await _repository.registerTask(task: task);

      return Task.fromData(data: taskReceived);
    } catch (err) {
      rethrow;
    }
  }

  Future<Task> updateTask({@required Task task}) async {
    try {
      var taskReceived = await _repository.updateTask(task: task);

      return Task.fromData(data: taskReceived);
    } catch (err) {
      rethrow;
    }
  }

  Future<Task> getTaskInfo({@required int id}) async {
    try {
      var task = await _repository.getTaskInfo(id: id);

      var taskDebug = Task.fromData(data: task);

      return taskDebug;
    } catch (err) {
      rethrow;
    }
  }
}
