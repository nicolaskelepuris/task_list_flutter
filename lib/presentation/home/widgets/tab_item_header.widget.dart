import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/menu_item_route.widget.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

class TabItemHeader extends GetView<PagesController> {
  final MenuItemRoute page;
  final double maxWidth;
  TabItemHeader(this.page, {@required this.maxWidth});

  final border = BorderSide(width: 1, color: Get.theme.primaryColor);

  final borderThin = BorderSide(width: .3, color: Get.theme.primaryColor);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var selected = page == controller.currentPage.value;
        return Stack(
          children: [
            Material(
              color: selected ? Colors.white : Colors.grey.withOpacity(.2),
              child: InkWell(
                onTap: !selected ? page.openScreen : null,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                  constraints: BoxConstraints(
                    minWidth:
                        controller.paginasAbertas.length == 1 ? maxWidth : 150,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      right: border,
                      bottom: selected ? BorderSide.none : border,
                    ),
                  ),
                  child: Text(
                    '${page.descricaoLonga}',
                    style: TextStyle(
                      color: selected
                          ? Get.theme.colorScheme.secondary
                          : Get.theme.primaryColor.withOpacity(.4),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(top: 1, right: 1, child: _CloseButton(page)),
          ],
        );
      },
    );
  }
}

class _CloseButton extends GetView<PagesController> {
  final MenuItemRoute page;
  const _CloseButton(this.page);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.paginasAbertas.length != 1,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => controller.removePage(page),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(Icons.close, size: 15),
            ),
          ),
        ),
      ),
    );
  }
}
