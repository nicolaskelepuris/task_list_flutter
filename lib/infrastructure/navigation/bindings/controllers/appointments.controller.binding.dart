import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/appointment.domain.binding.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/vessel.domain.binding.dart';
import 'package:task_list_app/presentation/appointments/controllers/appointments.controller.dart';
import 'package:task_list_app/presentation/home/widgets/custom_binding.dart';

class AppointmentsControllerBinding extends CustomBinding {
  AppointmentsControllerBinding();  
  @override
  void dependencies({Map<String, dynamic> arguments}) {
    var appointmentDomainBinding = AppointmentDomainBinding();
    var vesselDomainBinding = VesselDomainBinding();
    Get.lazyPut<AppointmentsController>(
      () => AppointmentsController(appointmentDomainService: appointmentDomainBinding.domain,
        loadingController: Get.find(), vesselDomainService: vesselDomainBinding.domain),
    );
  }
}