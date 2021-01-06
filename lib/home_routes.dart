import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:task_list_app/presentation/dashboard/controllers/dashboard.controller.dart';
import 'package:task_list_app/presentation/dashboard/dashboard.screen.dart';
import 'package:task_list_app/presentation/home/widgets/menu_item_route.widget.dart';
import 'package:task_list_app/presentation/screens.dart';
import 'package:task_list_app/presentation/users/controllers/users.controller.dart';
import 'package:task_list_app/presentation/vessels/controllers/vessels.controller.dart';

import 'infrastructure/navigation/bindings/controllers/dashboard.controller.binding.dart';
import 'infrastructure/navigation/home_named_routes.dart';

abstract class HomeRoutes {
  static final dashboard = MenuItemRoute(
    id: 1,
    descricao: 'Dashboard',
    descricaoLonga: 'Dashboard',
    icon: Icons.dashboard,
    path: HomeNamedRoutes.DASHBOARD,
    page: DashboardScreen(),
    binding: DashboardControllerBinding(),
    removeBinding: () => Get.delete<DashboardController>(),
  );

  static final vessels = MenuItemRoute(
    id: 2,
    descricao: 'Vessels',
    descricaoLonga: 'Vessels',
    icon: Icons.anchor,
    path: HomeNamedRoutes.VESSELS,
    page: VesselsScreen(),
    binding: VesselsControllerBinding(),
    removeBinding: () => Get.delete<VesselsController>(),
  );  

  static final appointments = MenuItemRoute(
    id: 3,
    descricao: 'Appointments',
    descricaoLonga: 'Appointments',
    icon: Icons.view_list,
    path: HomeNamedRoutes.APPOINTMENTS,
    page: AppointmentsScreen(),
    binding: AppointmentsControllerBinding(),
    removeBinding: () => Get.delete<AppointmentsController>(),
  ); 

  static final users = MenuItemRoute(
    id: 4,
    descricao: 'Users',
    descricaoLonga: 'Users',
    icon: Icons.supervisor_account,
    path: HomeNamedRoutes.USERS,
    page: UsersScreen(),
    binding: UsersControllerBinding(),
    removeBinding: () => Get.delete<UsersController>(),
  );
}
