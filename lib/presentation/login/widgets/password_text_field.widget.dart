import 'package:task_list_app/presentation/login/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordTextFieldWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Obx(
        () => TextFormField(
          onChanged: controller.password,
          textAlign: TextAlign.center,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => controller.doLogin(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            errorText: controller.passwordError.value,
            hintText: 'Password',
            hintStyle: Get.textTheme.headline6.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
