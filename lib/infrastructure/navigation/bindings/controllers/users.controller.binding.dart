import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:task_list_app/presentation/home/widgets/custom_binding.dart';
import 'package:task_list_app/presentation/users/controllers/users.controller.dart';

class UsersControllerBinding extends CustomBinding {
  UsersControllerBinding();
  @override
  void dependencies({Map<String, dynamic> arguments}) {
    var authDomainBinding = AuthDomainBinding();
    Get.lazyPut<UsersController>(
      () => UsersController(
        authDomainService: authDomainBinding.domain,
        loadingController: Get.find(),
      ),
    );
  }
}
