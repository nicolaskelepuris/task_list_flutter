import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

import 'menu_item_route.widget.dart';

class TabItemMaisItensHeaderWidget extends GetView<PagesController> {
  final border = BorderSide(width: 1, color: Get.theme.primaryColor);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var listOthersTab = List<MenuItemRoute>.from(controller.paginasAbertas)
            .skip(7)
            .toList();

        return PopupMenuButton<MenuItemRoute>(
          offset: Offset(0, 30),
          padding: EdgeInsets.all(0),
          onSelected: (page) => page.openScreen(),
          itemBuilder: (_) {
            return listOthersTab.map((e) {
              var selected = controller.currentPage.value == e;
              return PopupMenuItem(
                value: e,
                textStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
                child: Text(e.descricao),
              );
            }).toList();
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border(bottom: border, right: border),
              color: Colors.grey.withOpacity(.2),
            ),
            child: Center(
              child: Text(
                '+${controller.paginasAbertas.length - 6}',
                style: TextStyle(
                  color: Get.theme.primaryColor.withOpacity(.4),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
