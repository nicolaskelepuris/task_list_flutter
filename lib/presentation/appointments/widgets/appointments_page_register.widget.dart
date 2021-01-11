import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/save_button.widget.dart';

import 'appointment_form.widget.dart';
import 'cancel_button.widget.dart';
import 'new_button.widget.dart';

class AppointmentsPageRegisterWidget extends GetView<AppointmentsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeaderWidget(
          onBackPressed: controller.closeRegisterScreen,
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
                    onTap: controller.openTaskRegisterScreen,
                    buttonText: 'New Task',
                  ),
                  SizedBox(width: 20),
                  NewButtonWidget(
                    onTap: controller.clearForm,
                    buttonText: 'Clear',
                  ),
                  SizedBox(width: 20),
                  CancelButtonWidget(onTap: controller.discardEditChanges),
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
                  var appointment = controller.appointmentForm;
                  var hasInitialValue = appointment.id != null;
                  var vessels = controller.vessels;
                  var vesselSelected = controller.vesselSelected;
                  var appointmentType = appointment.type;

                  return AppointmentFormWidget(
                    appointment: appointment,
                    hasInitialValue: hasInitialValue,
                    vessels: vessels,
                    vesselSelected: vesselSelected,
                    appointmentType: appointmentType,
                    onAddTaskPressed: controller.openTaskRegisterScreen,
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
