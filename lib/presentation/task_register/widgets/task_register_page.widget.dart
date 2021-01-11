import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/appointments/widgets/new_button.widget.dart';
import 'package:task_list_app/presentation/appointments/widgets/task_form.widget.dart';
import 'package:task_list_app/presentation/task_register/controllers/task_register.controller.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/save_button.widget.dart';

class TaskRegisterPageWidget
    extends GetView<TaskRegisterController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeaderWidget(
          options: PlatformChecker.isMobile()
              ? [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      size: 28,
                    ),
                    onPressed: controller.clearForm,
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.clear,
                      size: 28,
                    ),
                    onPressed: controller.discardEditChanges,
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.save_alt,
                      size: 28,
                    ),
                    onPressed: controller.saveItem,
                  ),
                ]
              : [
                  NewButtonWidget(
                      onTap: controller.clearForm, buttonText: 'Clear'),
                  SizedBox(width: 20),
                  SaveButtonWidget(onTap: controller.saveItem),
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
                    appointments: appointments.toList(),
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
