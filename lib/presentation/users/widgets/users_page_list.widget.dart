import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
import 'package:task_list_app/presentation/appointments/widgets/new_button.widget.dart';
import 'package:task_list_app/presentation/users/controllers/users.controller.dart';
import 'package:task_list_app/presentation/vessels/widgets/data_cell.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/data_table.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';

class UsersPageListWidget extends GetView<UsersController> {
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
                  return DataTableWidget<UserModel>(
                    expand: true,
                    columns: ['Name', 'E-mail'],
                    rows: controller.users.map((e) {
                      return DataRow(
                        onSelectChanged: (_) => controller.openEditScreen(e),
                        cells: [
                          DataCellWidget(text: e.name, width: double.infinity),
                          DataCellWidget(text: e.email, width: double.infinity),
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
}
