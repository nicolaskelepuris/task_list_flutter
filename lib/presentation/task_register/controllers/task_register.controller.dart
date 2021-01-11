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

class TaskRegisterController extends GetxController
    implements RegisterController<Task> {
  final AppointmentDomainService _appointmentDomainService;
  final LoadingController _loadingController;

  TaskRegisterController({
    @required AppointmentDomainService appointmentDomainService,
    @required LoadingController loadingController,
  })  : _appointmentDomainService = appointmentDomainService,
        _loadingController = loadingController;

  @override
  void onReady() async {
    try {
      super.onReady();
      loadAppointments();
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    }
  }

  @override
  Future<List<Task>> getResources() async {
    return <Task>[];
  }

  Future<List<Appointment>> getAppointments() async {
    try {
      _loadingController.isLoading = true;

      var appointments = await _appointmentDomainService.getAppointmentsInfo();

      return appointments;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void openRegisterScreen() {
    Get.focusScope.unfocus();

    _appointmentSelected.value = taskForm?.appointmentId?.value != null
        ? appointments
            .where(
                (element) => element.id.value == taskForm.appointmentId.value)
            .first
        : Appointment.blank();
  }

  @override
  void closeRegisterScreen() {}

  @override
  void openEditScreen(Task task) {}

  @override
  void clearForm() {
    taskToBeEdited = Task.blank();
    _taskForm.value = Task.blank();

    _appointmentSelected.nil();

    Get.focusScope.unfocus();
  }

  @override
  void discardEditChanges() {
    clearForm();
  }

  @override
  void saveItem() async {
    try {
      if (validateRequiredFields) {
        _loadingController.isLoading = true;

        await _registerTask();

        clearForm();

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

  @override
  bool get validateRequiredFields {
    return taskForm.status?.value != null &&
        taskForm.appointmentId?.value != null &&
        taskForm.whenToComplete?.value != null &&
        !InputValidator.isNullOrEmpty(taskForm.name?.value) &&
        !InputValidator.isNullOrEmpty(taskForm.description?.value);
  }

  Future<void> loadAppointments() async {
    var appointments = await getAppointments();
    if (appointments != null) this.appointments.assignAll(appointments);
  }

  final appointments = <Appointment>[].obs;

  final itemMenu = HomeRoutes.taskRegister;

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
