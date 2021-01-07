import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:task_list_app/presentation/account/controllers/account.controller.dart';
import 'package:task_list_app/presentation/home/widgets/custom_binding.dart';

class AccountControllerBinding extends CustomBinding {
  AccountControllerBinding();
  @override
  void dependencies({Map<String, dynamic> arguments}) {
    var authDomainBinding = AuthDomainBinding();
    Get.lazyPut<AccountController>(
      () => AccountController(
        authDomainService: authDomainBinding.domain,
        loadingController: Get.find(),
      ),
    );
  }
}