import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_list_app/domain/core/utils/menu.util.dart';
import 'package:task_list_app/presentation/home/widgets/item_menu.widget.dart';
import 'package:task_list_app/presentation/home/widgets/menu_header.widget.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

class MenuWidget extends GetView<PagesController> {
  final String headerText;
  final Image headerLogo;

  MenuWidget({this.headerText = '', @required this.headerLogo});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: controller.menuExpanded.value
            ? MediaQuery.of(context).size.width * .17
            : MediaQuery.of(context).size.width * .05,
        onEnd: () => controller.showItens.value = controller.menuExpanded.value,
        child: Material(
          elevation: 5,
          color: Colors.white,
          child: Column(
            children: [
              MenuHeaderWidget(
                text: headerText,
                image: headerLogo,
                menuExpanded: controller.menuExpanded,
                showItem: controller.showItens.value,
              ),
              SizedBox(height: 10),
              AnimatedCrossFade(
                duration: Duration(milliseconds: 100),
                crossFadeState:
                    controller.menuExpanded.value && controller.showItens.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                firstChild: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuTypeWidget(
                      id: 0,
                      text: 'MENU',
                    ),
                  ],
                ),
                secondChild: SizedBox.shrink(),
              ),
              SizedBox(height: 10),
              Expanded(
                child: IndexedStack(
                  index: controller.currentMenu.value,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: controller.menuItems.map(
                            (e) {
                              return ItemMenuWidget(
                                item: e,
                                isMenuItemExpanded: false.obs,
                                currentPage: controller.currentPage,
                                menuExpanded: controller.menuExpanded.value,
                                showItem: controller.showItens,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                    Text(''),
                    Text('')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuTypeWidget extends GetView<PagesController> {
  final int id;
  final String text;
  const MenuTypeWidget({
    @required this.id,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var selected = controller.currentMenu.value == id;

        return InkWell(
          onTap: () => controller.currentMenu.value = id,
          child: Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * .045,
            ),
            decoration: BoxDecoration(
              color: selected
                  ? Get.theme.primaryColor.withOpacity(.3)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Get.theme.primaryColor,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
        );
      },
    );
  }
}
