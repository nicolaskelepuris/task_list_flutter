import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
    );
  }
}
