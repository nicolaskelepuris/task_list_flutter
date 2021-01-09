import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/appointment/appointment.domain.service.dart';
import 'package:task_list_app/domain/core/utils/snackbar.util.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/domain/vessel/models/task.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/domain/vessel/vessel.domain.service.dart';
import 'package:task_list_app/helpers/input_validator.dart';
import 'package:task_list_app/presentation/shared/loading/loading.controller.dart';

import '../../../home_routes.dart';
import '../../../register_controller.dart';

class AppointmentsController extends GetxController
    implements RegisterController<Appointment> {
  final AppointmentDomainService _appointmentDomainService;
  final LoadingController _loadingController;
  final VesselDomainService _vesselDomainService;

  AppointmentsController({
    @required AppointmentDomainService appointmentDomainService,
    @required LoadingController loadingController,
    @required VesselDomainService vesselDomainService,
  })  : _appointmentDomainService = appointmentDomainService,
        _loadingController = loadingController,
        _vesselDomainService = vesselDomainService;

  @override
  void onReady() async {
    try {
      super.onReady();
      loadAppointments();
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    }
  }

  var vessels = <Vessel>[].obs;
  var _vesselSelected = Rx<Vessel>();
  @override
  Future<List<Appointment>> getResources() async {
    try {
      _loadingController.isLoading = true;

      var vessels = await _vesselDomainService.getVesselsInfo();

      this.vessels.assignAll(vessels);

      var appointments = await _appointmentDomainService.getAppointmentsInfo();

      return appointments;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<Appointment> loadAppointment() async {
    try {
      _loadingController.isLoading = true;

      var appointment = taskToBeEdited.appointmentId?.value != null ||
              appointmentToBeEdited.id?.value != null
          ? await _appointmentDomainService.getAppointmentInfo(
              id: taskToBeEdited.appointmentId?.value ??
                  appointmentToBeEdited.id?.value)
          : Appointment.blank();

      return appointment;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void openRegisterScreen() {
    pageIndex.value = 1;
    Get.focusScope.unfocus();
  }

  void openTaskRegisterScreen() {
    pageIndex.value = 2;
    Get.focusScope.unfocus();
    taskToBeEdited.appointmentId.value = appointmentToBeEdited.id?.value;
    _taskForm.value.appointmentId.value = appointmentToBeEdited.id?.value;

    _appointmentSelected.value = taskForm?.appointmentId?.value != null
        ? appointments
            .where(
                (element) => element.id.value == taskForm.appointmentId.value)
            .first
        : Appointment.blank();
  }

  @override
  void closeRegisterScreen() {
    pageIndex.value = 0;
    appointmentToBeEdited = Appointment.blank();
    _appointmentForm.value = Appointment.blank();
    _vesselSelected.nil();
    Get.focusScope.unfocus();
    loadAppointments();
  }

  Future<void> closeTaskRegisterScreen() async {
    var appointment = await loadAppointment();

    taskToBeEdited = Task.blank();
    _taskForm.value = Task.blank();

    _appointmentSelected.nil();

    if (appointment.id?.value != null) {
      openEditScreen(appointment);
    } else {
      pageIndex.value = 1;
    }

    Get.focusScope.unfocus();
  }

  @override
  void openEditScreen(Appointment appointment) {
    appointmentToBeEdited = appointment.clone();
    _appointmentForm.value = appointment.clone();

    _vesselSelected.value = appointmentForm?.vesselId != null
        ? vessels
            .where((element) => element.id == appointmentForm.vesselId.value)
            .first
        : Vessel.blank();
    openRegisterScreen();
  }

  void openTaskEditScreen(Task task) {
    taskToBeEdited = task.clone();
    _taskForm.value = task.clone();

    openTaskRegisterScreen();
  }

  @override
  void clearForm() {
    appointmentToBeEdited = Appointment.blank();
    _appointmentForm.value = Appointment.blank();
    _vesselSelected.nil();
    Get.focusScope.unfocus();
  }

  void clearTaskForm() {
    taskToBeEdited = Task.blank();
    _taskForm.value = Task.blank();

    _appointmentSelected.nil();

    Get.focusScope.unfocus();
  }

  @override
  void discardEditChanges() {
    openEditScreen(appointmentToBeEdited.clone());
  }

  void discardTaskEditChanges() {
    openTaskEditScreen(taskToBeEdited.clone());
  }

  @override
  void saveItem() async {
    try {
      if (validateRequiredFields) {
        if (validateNotRequiredFields()) {
          _loadingController.isLoading = true;

          appointmentToBeEdited = appointmentForm.id == null
              ? await _registerAppointment()
              : await _updateAppointment();

          Get.focusScope.unfocus();
        }
      } else {
        SnackbarUtil.showWarning(
          message: 'All required fields must be filled',
        );
      }
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  void saveTask() async {
    try {
      if (validateTaskRequiredFields) {
        _loadingController.isLoading = true;

        taskToBeEdited = taskForm.id?.value == null
            ? await _registerTask()
            : await _updateTask();

        Get.focusScope.unfocus();
      } else {
        SnackbarUtil.showWarning(
          message: 'All required fields must be filled',
        );
      }
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<Task> _registerTask() async {
    try {
      var task = await _appointmentDomainService.registerTask(task: taskForm);

      SnackbarUtil.showSuccess(
          message: 'Task "${task.name}" has been registered');
      return task;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    }
  }

  Future<Task> _updateTask() async {
    try {
      var task = await _appointmentDomainService.updateTask(task: taskForm);

      SnackbarUtil.showSuccess(message: 'Task "${task.name}" has been updated');
      return task;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    }
  }

  Future<Appointment> _registerAppointment() async {
    try {
      var appointment = await _appointmentDomainService.registerAppointment(
          appointment: appointmentForm);

      SnackbarUtil.showSuccess(
          message:
              'Appointment "${appointment.vesselName} at ${appointment.appointmentPort}" has been registered');
      return appointment;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    }
  }

  Future<Appointment> _updateAppointment() async {
    try {
      var appointment = await _appointmentDomainService.updateAppointment(
          appointment: appointmentForm);

      SnackbarUtil.showSuccess(
          message:
              'Appointment "${appointment.vesselName} at ${appointment.appointmentPort}" has been updated');
      return appointment;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    }
  }

  bool get validateTaskRequiredFields {
    return taskForm.status?.value != null &&
        taskForm.appointmentId?.value != null &&
        taskForm.whenToComplete?.value != null &&
        !InputValidator.isNullOrEmpty(taskForm.name?.value) &&
        !InputValidator.isNullOrEmpty(taskForm.description?.value);
  }

  @override
  bool get validateRequiredFields {
    return appointmentForm.status?.value != null &&
        appointmentForm.type?.value != null &&
        appointmentForm.vesselId?.value != null &&
        appointmentForm.port?.value != null &&
        appointmentForm.operationType?.value != null;
  }

  bool validateNotRequiredFields() {
    var fieldsWithError = <String>[];

    if (appointmentForm.onSigners.value == null) {
      fieldsWithError.add('On-signers');
    }
    if (appointmentForm.offSigners.value == null) {
      fieldsWithError.add('Off-signers');
    }

    if (fieldsWithError.isNotEmpty) {
      var errorsFields = '"${fieldsWithError[0]}"';
      if (fieldsWithError.length == 1) {
        SnackbarUtil.showWarning(
          message: '$errorsFields must be correctly filled',
        );
      } else {
        for (var i = 1; i < fieldsWithError.length; i++) {
          errorsFields = '$errorsFields, "${fieldsWithError[i]}"';
        }

        SnackbarUtil.showWarning(
          message: '$errorsFields must be correctly filled',
        );
      }
    }

    return fieldsWithError.isEmpty;
  }

  Future<void> loadAppointments() async {
    var appointments = await getResources();
    if (appointments != null) this.appointments.assignAll(appointments);
  }

  final appointments = <Appointment>[].obs;

  Appointment appointmentToBeEdited = Appointment.blank();

  final _appointmentForm = Appointment.blank().obs;
  Appointment get appointmentForm => _appointmentForm.value;
  Vessel get vesselSelected => _vesselSelected.value;

  final itemMenu = HomeRoutes.appointments;

  final pageIndex = 0.obs;

  var taskToBeEdited = Task.blank();
  final _taskForm = Task.blank().obs;
  Task get taskForm => _taskForm.value;

  var _appointmentSelected = Rx<Appointment>();
  Appointment get appointmentSelected => _appointmentSelected.value;

  @override
  Future<void> deleteItem() {
    throw UnimplementedError();
  }
}
