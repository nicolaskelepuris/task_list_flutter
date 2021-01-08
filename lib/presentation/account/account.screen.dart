import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/account/widgets/account_page_register.widget.dart';

import 'controllers/account.controller.dart';

class AccountScreen extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountPageRegisterWidget(),
    );
  }
}
