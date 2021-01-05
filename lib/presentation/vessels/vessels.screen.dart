import 'package:task_list_app/presentation/vessels/controllers/vessels.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_list.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_register.widget.dart';

class VesselsScreen extends GetView<VesselsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(index: controller.pageIndex.value, children: [
          PageListWidget(),
          PageRegisterWidget(),
        ]),
      ),
    );
  }
}
