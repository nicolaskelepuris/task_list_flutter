import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/menu_item_route.widget.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

void setCurrentPage(MenuItemRoute item, {Map<String, dynamic> arguments}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    PagesController controller = Get.find();
    controller.setCurrentPage(item, arguments: arguments);
  });
}

void removePage(MenuItemRoute item) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    PagesController controller = Get.find();
    controller.removePage(item);
  });
}