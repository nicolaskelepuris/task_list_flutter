import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/core/utils/menu.util.dart';
import 'package:task_list_app/presentation/home/widgets/menu_item_route.widget.dart';

class PagesController extends GetxController {
  final ScrollController _scrollController;
  PagesController() : _scrollController = ScrollController();

  ScrollController get scrollCrontroller => _scrollController;

  @override
  void onInit() {
    super.onInit();
    ever<MenuItemRoute>(currentPage, _addPage);
    ever<MenuItemRoute>(currentPage, _moveToItem);

    currentPage.value = MenuUtil.allItens.first;
    menuItems.assignAll(MenuUtil.allItens);
  }

  final menuItems = <MenuItemRoute>[].obs;

  void _moveToItem(MenuItemRoute item) {
    if (_scrollController.hasClients) {
      this.arguments = null;
      var index = paginasAbertas.indexOf(item);
      _scrollController.animateTo(
        index * 100.0,
        duration: Duration(seconds: 2),
        curve: Curves.ease,
      );
    }
  }

  void _addPage(MenuItemRoute item) {
    if (!paginasAbertas.any((i) => i == item)) {
      item.binding.dependencies(arguments: this.arguments);
      paginasAbertas.add(item);
    }
  }

  void removePage(MenuItemRoute item) {
    if (paginasAbertas.length != 1) {
      this.arguments = null;
      if (item == currentPage.value) {
        var index = paginasAbertas.indexOf(item);
        if (index == (paginasAbertas.length - 1)) {
          currentPage.value = paginasAbertas[--index];
        } else {
          currentPage.value = paginasAbertas[++index];
        }
        currentPage.value.openScreen();
      }
      paginasAbertas.removeWhere((i) => i == item);
      item.removeBinding();
    }
  }

  void expandirMenu() {
    menuExpanded.value = !menuExpanded.value;
    currentMenu.value = 0;
  }

  void setCurrentPage(MenuItemRoute item, {Map<String, dynamic> arguments}) {
    this.arguments = arguments;
    currentPage.value = item;
  }

  Map<String, dynamic> arguments;

  final currentPage = Rx<MenuItemRoute>();

  final paginasAbertas = <MenuItemRoute>[].obs;

  final currentMenu = 0.obs;

  final showItens = true.obs;

  final menuExpanded = true.obs;
}
