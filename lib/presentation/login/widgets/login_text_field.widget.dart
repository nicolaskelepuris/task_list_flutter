import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/login/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextFieldWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: PlatformChecker.isMobile() ? MediaQuery.of(context).size.width * 0.6 : MediaQuery.of(context).size.width * 0.3,
      child: Obx(
        () => TextFormField(
          onChanged: controller.login,
          textAlign: TextAlign.center,
          focusNode: controller.loginFocus,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            controller.passwordFocus.requestFocus();
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            errorText: controller.loginError.value,
            hintText: 'E-mail',
            hintStyle: Get.textTheme.headline6.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
