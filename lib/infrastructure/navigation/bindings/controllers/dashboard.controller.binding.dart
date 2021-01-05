import 'package:get/get.dart';
import 'package:task_list_app/presentation/home/widgets/custom_binding.dart';

import './../../../../presentation/dashboard/controllers/dashboard.controller.dart';

class DashboardControllerBinding extends CustomBinding {
  @override
  void dependencies({Map<String, dynamic> arguments}) {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
