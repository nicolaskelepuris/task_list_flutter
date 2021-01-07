import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/controllers/home.controller.dart';

class AppBarWidget extends StatelessWidget {
  final HomeController controller = Get.find();
  AppBarWidget({@required this.onLogout});
  final Function onLogout;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return Text(
            controller.username?.value != null ? controller.username.value : '',
            style: TextStyle(color: Colors.white, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          );
        }),
        SizedBox(width: 7),
        IconButton(
          onPressed: () {},
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

enum SettingsOptions {
  Logout,
}
