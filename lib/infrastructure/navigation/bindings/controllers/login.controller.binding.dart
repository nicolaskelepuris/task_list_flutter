import 'package:task_list_app/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    var authDomainBinding = AuthDomainBinding();

    Get.lazyPut<LoginController>(
      () => LoginController(
        authDomainService: authDomainBinding.domain,
        loadingController: Get.find(),
      ),
    );
  }
}
