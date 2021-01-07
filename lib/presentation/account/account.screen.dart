import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/account.controller.dart';

class AccountScreen extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Account is working', 
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}