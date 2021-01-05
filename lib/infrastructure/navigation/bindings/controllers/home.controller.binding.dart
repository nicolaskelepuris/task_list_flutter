import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';

import './../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    var authDomainBinding = AuthDomainBinding();
    Get.lazyPut<HomeController>(
      () => HomeController(authDomainService: authDomainBinding.domain,),
    );
  }
}
