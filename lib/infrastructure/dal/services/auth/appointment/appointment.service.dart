import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/appointment/dto/get_appointments_info.response.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/appointment/dto/get_task_info.response.dart';

import 'dto/get_appointment_info.response.dart';
import 'dto/register_appointment.body.dart';
import 'dto/register_task.body.dart';

class AppointmentService {
  final GetConnect _connect;
  AppointmentService({@required GetConnect connect}) : _connect = connect;

  Future<GetAppointmentsInfoResponse> getAppointmentsInfo() async {
    var response = await _connect.get('appointments');

    if (!response.hasError) {
      var model = GetAppointmentsInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }

  Future<GetAppointmentInfoResponse> getAppointmentInfo(
      {@required int id}) async {
    var response = await _connect.get('appointments/$id');

    if (!response.hasError) {
      var model = GetAppointmentInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }

  Future<GetAppointmentInfoResponse> registerAppointment(
      RegisterAppointmentBody body, String token) async {
    var response = await _connect.post('appointments', body.toJson(),
        headers: {'Authorization': 'Bearer $token'});

    if (!response.hasError) {
      var model = GetAppointmentInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<GetAppointmentInfoResponse> updateAppointment({
    RegisterAppointmentBody body,
    String token,
    int id,
  }) async {
    var response = await _connect.put(
      'appointments/$id',
      body.toJson(),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (!response.hasError) {
      var model = GetAppointmentInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<GetTaskInfoResponse> registerTask(
      RegisterTaskBody body, String token) async {
    var response = await _connect.post('tasks', body.toJson(),
        headers: {'Authorization': 'Bearer $token'});

    if (!response.hasError) {
      var model = GetTaskInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<GetTaskInfoResponse> updateTask(
      {RegisterTaskBody body, String token, int id}) async {
    var response = await _connect.put('tasks/$id', body.toJson(),
        headers: {'Authorization': 'Bearer $token'});

    if (!response.hasError) {
      var model = GetTaskInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<GetTaskInfoResponse> getTaskInfo(
      {@required int id}) async {
    var response = await _connect.get('tasks/$id');

    if (!response.hasError) {
      var model = GetTaskInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }
}
