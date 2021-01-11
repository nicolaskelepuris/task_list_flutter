import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/appointment.domain.binding.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/vessel.domain.binding.dart';
import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:task_list_app/presentation/home/widgets/custom_binding.dart';
import 'package:task_list_app/presentation/task_register/controllers/task_register.controller.dart';

class TaskRegisterControllerBinding extends CustomBinding {
  TaskRegisterControllerBinding();
  @override
  void dependencies({Map<String, dynamic> arguments}) {
    var appointmentDomainBinding = AppointmentDomainBinding();
    Get.lazyPut<TaskRegisterController>(
      () => TaskRegisterController(
        appointmentDomainService: appointmentDomainBinding.domain,
        loadingController: Get.find(),
      ),
    );
  }
}
