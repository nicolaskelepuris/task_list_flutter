import 'package:task_list_app/presentation/login/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Obx(
          () => RaisedButton(
            onPressed: controller.enableButton ? controller.doLogin : null,
            color: Get.theme.primaryColor,
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text(
                  'ENTER',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
