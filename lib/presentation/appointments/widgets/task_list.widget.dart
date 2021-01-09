import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/domain/vessel/models/task.dart';
import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:task_list_app/presentation/vessels/widgets/data_cell.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/data_table.widget.dart';
import 'package:intl/intl.dart';

class TaskListWidget extends GetView<AppointmentsController> {
  final Appointment appointment;
  TaskListWidget({@required this.appointment});

  String _dateToString(DateTime date) {
    return date != null && date.year != 1970
        ? DateFormat('dd/MM/yyyy HH:mm').format(date)
        : '-';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Obx(() {
            return DataTableWidget<Task>(
              expand: true,
              columns: [
                'Task',
                'Description',
                'Deadline',
                'Status'
              ],
              rows: appointment.tasks.map((e) {
                return DataRow(
                  onSelectChanged: (_) => controller.openTaskEditScreen(e),
                  cells: [
                    DataCellWidget(text: e.name.value, width: double.infinity),
                    DataCellWidget(
                        text: e.description.value, width: double.infinity),
                    DataCellWidget(
                        text: _dateToString(e.deadline.value),
                        width: double.infinity),
                    DataCellWidget(text: e.taskStatus, width: double.infinity),
                  ],
                );
              }).toList(),
            );
          }),
        ),
      ),
    );
  }
}
