import 'package:task_list_app/presentation/users/widgets/users_page_list.widget.dart';
import 'package:task_list_app/presentation/users/widgets/users_page_register.widget.dart';
import 'package:task_list_app/presentation/vessels/controllers/vessels.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_list.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_register.widget.dart';

import 'controllers/users.controller.dart';

class UsersScreen extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(index: controller.pageIndex.value, children: [
          UsersPageListWidget(),
          UsersPageRegisterWidget(),
        ]),
      ),
    );
  }
}
