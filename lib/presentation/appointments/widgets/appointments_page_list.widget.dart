import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:task_list_app/presentation/vessels/widgets/data_cell.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/data_table.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';
import 'package:intl/intl.dart';

import 'new_button.widget.dart';

class AppointmentsPageListWidget extends GetView<AppointmentsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PageHeaderWidget(
          options: [
            NewButtonWidget(onTap: controller.openRegisterScreen),
          ],
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Obx(() {
                  return DataTableWidget<Appointment>(
                    expand: true,
                    columns: ['Vessel', 'Type', 'ETA', 'ETB', 'ETS', 'Tasks'],
                    rows: controller.appointments.map((e) {
                      return DataRow(
                        onSelectChanged: (_) => controller.openEditScreen(e),
                        cells: [
                          DataCellWidget(
                              text: e.vesselName.value, width: double.infinity),
                          DataCellWidget(
                              text: e.appointmentType, width: double.infinity),
                          DataCellWidget(
                              text:
                                  _dateToString(e.estimatedTimeOfArrival.value),
                              width: double.infinity),
                          DataCellWidget(
                              text: _dateToString(
                                  e.estimatedTimeOfBerthing.value),
                              width: double.infinity),
                          DataCellWidget(
                              text:
                                  _dateToString(e.estimatedTimeOfSailing.value),
                              width: double.infinity),
                          DataCellWidget(
                              text: _getTasksString(e), width: double.infinity),
                        ],
                      );
                    }).toList(),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _dateToString(DateTime date) {
    return date != null && date.year != 1970
        ? DateFormat('dd/MM/yyyy HH:mm').format(date)
        : '-';
  }

  String _getTasksString(Appointment appointment) {
    if (appointment.tasks.isEmpty) return '-';

    var tasksString = '${appointment.tasks[0].name}';

    if (appointment.tasks.length > 1) {
      for (var i = 1; i < appointment.tasks.length; i++) {
        tasksString = '$tasksString, ${appointment.tasks[i].name}';
      }
    }

    return tasksString;
  }
}
