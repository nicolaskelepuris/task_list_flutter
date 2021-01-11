import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/appointments/widgets/appointments_page_task_register.widget.dart';
import 'package:task_list_app/presentation/task_register/widgets/task_register_page.widget.dart';

import 'controllers/task_register.controller.dart';
 class TaskRegisterScreen extends GetView<TaskRegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(index: controller.pageIndex.value, children: [
          TaskRegisterPageWidget(),
        ]),
      ),
    );
  }
}
