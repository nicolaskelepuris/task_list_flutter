import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/menu_item_route.widget.dart';

class ItemMenuWidget extends StatelessWidget {
  final Rx<MenuItemRoute> currentPage;
  final MenuItemRoute item;
  final RxBool isMenuItemExpanded;
  final bool menuExpanded;
  final RxBool showItem;
  const ItemMenuWidget({
    @required this.item,
    @required this.isMenuItemExpanded,
    @required this.currentPage,
    @required this.menuExpanded,
    @required this.showItem,
  });

  Function() onTap({
    @required bool selected,
    @required List<MenuItemRoute> subMenu,
    @required Function() callbackScreen,
    @required Function() callbackExpanded,
  }) {
    if (!selected) {
      if (subMenu != null) {
        return callbackExpanded;
      } else {
        return callbackScreen;
      }
    }

    return null;
  }

  Icon showIcon({
    @required List<MenuItemRoute> subMenu,
    @required bool expanded,
  }) {
    if (subMenu != null) {
      IconData iconData;
      double size;

      if (expanded) {
        iconData = Icons.keyboard_arrow_down;
        size = 25;
      } else {
        iconData = Icons.arrow_forward_ios;
        size = 15;
      }

      return Icon(iconData, size: size, color: Get.theme.primaryColor);
    }

    return null;
  }

  List<Widget> buildChildren({@required List<MenuItemRoute> subMenu}) {
    if (subMenu != null) {
      return subMenu.map(
        (e) {
          return Padding(
            padding: EdgeInsets.only(left: 8),
            child: ItemMenuWidget(
              item: e,
              isMenuItemExpanded: false.obs,
              currentPage: currentPage,
              menuExpanded: menuExpanded,
              showItem: showItem,
            ),
          );
        },
      ).toList();
    } else {
      return [SizedBox()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var selected = item == currentPage.value;
        var subMenu = item.subMenu;
        var openScreen = item.openScreen;
        var expanded = isMenuItemExpanded.value;

        return Column(
          children: [
            ListTile(
              dense: true,
              onTap: onTap(
                selected: selected,
                subMenu: subMenu,
                callbackScreen: openScreen,
                callbackExpanded: () =>
                    isMenuItemExpanded.value = !isMenuItemExpanded.value,
              ),
              hoverColor: Get.theme.primaryColor.withOpacity(.1),
              selected: selected,
              selectedTileColor: Get.theme.primaryColor.withOpacity(.1),
              trailing: showIcon(expanded: expanded, subMenu: subMenu),
              title: Row(
                mainAxisAlignment: menuExpanded
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  item.icon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            right: menuExpanded ? 10 : 0,
                          ),
                          child: Icon(
                            item.icon,
                            color: selected
                                ? Get.theme.colorScheme.secondary
                                : Colors.grey,
                          ),
                        )
                      : SizedBox(),
                  Visibility(
                    visible: menuExpanded && showItem.value,
                    child: Text(
                      item.descricao,
                      style: TextStyle(
                        color: selected
                            ? Get.theme.colorScheme.secondary
                            : Get.theme.primaryColor,
                        fontWeight:
                            selected ? FontWeight.w600 : FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: expanded,
              child: Column(children: buildChildren(subMenu: subMenu)),
            ),
          ],
        );
      },
    );
  }
}
