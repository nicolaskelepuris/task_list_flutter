import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';
import 'package:task_list_app/presentation/home/widgets/tab_item_header.widget.dart';
import 'package:task_list_app/presentation/home/widgets/tab_item_mais_itens_header.widget.dart';

class HeaderPagesWidget extends GetView<PagesController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Container(
        constraints: BoxConstraints(maxHeight: 40),
        child: Obx(
          () {
            return ListView(
              scrollDirection: Axis.horizontal,
              controller: controller.scrollCrontroller,
              children: controller.paginasAbertas.length < 7
                  ? controller.paginasAbertas
                      .map(
                        (page) => TabItemHeader(
                          page,
                          maxWidth: constraints.maxWidth,
                        ),
                      )
                      .toList()
                  : List.generate(
                      7,
                      (index) {
                        var page = controller.paginasAbertas[index];
                        if (index != 6) {
                          return TabItemHeader(
                            page,
                            maxWidth: constraints.maxWidth,
                          );
                        } else {
                          return TabItemMaisItensHeaderWidget();
                        }
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
