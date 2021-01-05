import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:task_list_app/presentation/appointments/widgets/task_form.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/save_button.widget.dart';

import 'cancel_button.widget.dart';
import 'new_button.widget.dart';

class AppointmentsPageTaskRegisterWidget
    extends GetView<AppointmentsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeaderWidget(
          onBackPressed: () async => await controller.closeTaskRegisterScreen(),
          options: [
            NewButtonWidget(
                onTap: controller.clearTaskForm, buttonText: 'Clear'),
            SizedBox(width: 20),
            CancelButtonWidget(onTap: controller.discardTaskEditChanges),
            SizedBox(width: 20),
            SaveButtonWidget(onTap: controller.saveTask),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: Obx(
                () {
                  var task = controller.taskForm;
                  var hasInitialValue = task.id?.value != null;
                  var appointments = controller.appointments;
                  var appointmentSelected = controller.appointmentSelected;

                  return TaskFormWidget(
                    task: task,
                    hasInitialValue: hasInitialValue,
                    appointments: appointments,
                    appointmentSelected: appointmentSelected,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
