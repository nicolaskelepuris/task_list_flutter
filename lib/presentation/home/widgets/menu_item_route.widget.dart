import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/presentation/home/widgets/set_current_page.function.dart';

import 'custom_binding.dart';

class MenuItemRoute {
  int id;
  String descricao;
  String descricaoLonga;
  String path;
  List<MenuItemRoute> subMenu;
  IconData icon;
  Widget page;
  CustomBinding binding;
  void Function() removeBinding;

  void openScreen({Map<String, dynamic> arguments}) => setCurrentPage(
        this,
        arguments: arguments,
      );

  void closeScreen() => removePage(this);

  MenuItemRoute({
    @required this.id,
    @required this.descricao,
    @required this.descricaoLonga,
    @required this.path,
    @required this.page,
    @required this.binding,
    @required this.removeBinding,
    this.icon,
    this.subMenu,
  });
}
