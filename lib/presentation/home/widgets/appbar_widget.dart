import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/controllers/home.controller.dart';

class AppBarWidget extends StatelessWidget {
  final HomeController controller = Get.find();
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
        SizedBox(width: 7),
      ],
    );
  }
}
