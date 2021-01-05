import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/page_constraints.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';
import 'header_pages.widget.dart';

class PagesWidget extends GetView<PagesController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.white,
      child: Column(
        children: [
          HeaderPagesWidget(),
          Expanded(
            child: Obx(
              () {
                var index = controller.paginasAbertas.indexOf(
                  controller.currentPage.value,
                );

                return LayoutBuilder(
                  builder: (_, constraints) {
                    PageConstraints.maxWidth = constraints.maxWidth;

                    return IndexedStack(
                      index: index,
                      children: controller.paginasAbertas
                          .map(
                            (e) => e.page,
                          )
                          .toList(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
