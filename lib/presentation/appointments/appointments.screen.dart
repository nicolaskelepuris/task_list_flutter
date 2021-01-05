import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/appointments/widgets/appointments_page_list.widget.dart';
import 'package:task_list_app/presentation/appointments/widgets/appointments_page_register.widget.dart';
import 'package:task_list_app/presentation/appointments/widgets/appointments_page_task_register.widget.dart';
 class AppointmentsScreen extends GetView<AppointmentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(index: controller.pageIndex.value, children: [
          AppointmentsPageListWidget(),
          AppointmentsPageRegisterWidget(),
          AppointmentsPageTaskRegisterWidget(),
        ]),
      ),
    );
  }
}
