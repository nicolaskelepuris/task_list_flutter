import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/presentation/appointments/widgets/new_button.widget.dart';
import 'package:task_list_app/presentation/vessels/controllers/vessels.controller.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';

import 'data_cell.widget.dart';
import 'data_table.widget.dart';

class PageListWidget extends GetView<VesselsController> {
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
                  return DataTableWidget<Vessel>(
                    expand: true,
                    columns: ['Name', 'IMO', 'Flag'],
                    rows: controller.vessels.map((e) {
                      return DataRow(
                        onSelectChanged: (_) => controller.openEditScreen(e),
                        cells: [
                          DataCellWidget(text: e.name, width: double.infinity),
                          DataCellWidget(text: e.imo, width: double.infinity),
                          DataCellWidget(text: e.flag, width: double.infinity),
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
