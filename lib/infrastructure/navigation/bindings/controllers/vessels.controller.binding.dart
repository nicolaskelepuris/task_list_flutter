import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/vessel.domain.binding.dart';
import 'package:task_list_app/presentation/home/widgets/custom_binding.dart';
import 'package:task_list_app/presentation/vessels/controllers/vessels.controller.dart';

class VesselsControllerBinding extends CustomBinding {
  VesselsControllerBinding();
  @override
  void dependencies({Map<String, dynamic> arguments}) {
    var vesselDomainBinding = VesselDomainBinding();
    Get.lazyPut<VesselsController>(
      () => VesselsController(
        vesselDomainService: vesselDomainBinding.domain,
        loadingController: Get.find(),
      ),
    );
  }
}
