import 'package:flutter/foundation.dart';

class ItemMenuModel {
  int id;
  String description;
  String longDescription;
  String path;
  void Function() openScreen;
  List<ItemMenuModel> subMenu;

  ItemMenuModel({
    @required this.id,
    @required this.description,
    @required this.openScreen,
    @required this.longDescription,
    @required this.path,
    this.subMenu,
  });
}
