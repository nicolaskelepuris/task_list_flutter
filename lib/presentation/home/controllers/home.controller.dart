import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/auth.domain.service.dart';
import 'package:task_list_app/home_routes.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

class HomeController extends GetxController {
  final ScrollController _scrollController;
  final AuthDomainService _authDomainService;
  HomeController({
    @required AuthDomainService authDomainService,
  })  : _scrollController = ScrollController(),
        _authDomainService = authDomainService;

  ScrollController get scrollCrontroller => _scrollController;

  @override
  void onReady() async {
    super.onReady();
    try {
      var user = await _authDomainService.getCurrentUser();
      this.username.value = user.name;

      PagesController pagesController = Get.find();

      if (user.isAdmin) {
        pagesController.menuItems.add(HomeRoutes.users);
      }
    } catch (err) {}
  }

  var username = RxString();
}
