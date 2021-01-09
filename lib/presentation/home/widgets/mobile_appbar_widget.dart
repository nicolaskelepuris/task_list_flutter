import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/controllers/home.controller.dart';
import 'package:task_list_app/presentation/home/widgets/appbar_widget.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

import '../../../home_routes.dart';

class MobileAppBarWidget extends AppBar {
  final HomeController controller = Get.find();
  MobileAppBarWidget({@required this.onLogout});
  final Function onLogout;

  AppBar build() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            PagesController pagesController = Get.find();
            pagesController.setCurrentPage(HomeRoutes.account);
          },
          iconSize: 32,
          color: Colors.white,
          icon: Icon(Icons.account_circle),
        ),
        SizedBox(width: 10),
        PopupMenuButton<SettingsOptions>(
          child: Icon(
            Icons.settings,
            size: 32,
            color: Colors.white,
          ),
          onSelected: (option) {
            if (option == SettingsOptions.Logout) {
              onLogout();
            }
          },
          offset: Offset.fromDirection(1.571, 40.0),
          itemBuilder: (_) {
            return <PopupMenuEntry<SettingsOptions>>[
              PopupMenuItem(
                child: Text('Logout'),
                value: SettingsOptions.Logout,
              )
            ];
          },
        ),
        SizedBox(width: 7),
      ],
    );
  }
}
