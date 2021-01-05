import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/auth.domain.service.dart';

class HomeController extends GetxController {
  final ScrollController _scrollController;
  final AuthDomainService _authDomainService;
  HomeController({
    @required AuthDomainService authDomainService,
  }) : _scrollController = ScrollController(), _authDomainService = authDomainService;

  ScrollController get scrollCrontroller => _scrollController;

  @override
  void onReady() async {
    super.onReady();
    try {
      this.username.value = await _authDomainService.getUsername();
    } catch (err) {}
  }
  var username = RxString();
}
