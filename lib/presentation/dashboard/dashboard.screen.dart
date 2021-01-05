import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashboardScreen is working', 
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
