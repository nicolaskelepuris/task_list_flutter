import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_list_app/domain/appointment/appointment.domain.repository.dart';
import 'package:task_list_app/domain/appointment/appointment.domain.service.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/appointment/appointment.service.dart';

class AppointmentDomainBinding {
  AppointmentDomainService _appointmentDomainService;
  AppointmentDomainService get domain => _appointmentDomainService;

  AppointmentDomainBinding() {
    GetConnect connect = Get.find();
    GetStorage storage = Get.find();
    
    var appointmentService = AppointmentService(connect: connect);
    var appointmentDomainRepository = AppointmentDomainRepository(
      appointmentService: appointmentService,
      storage: storage
    );
    _appointmentDomainService = AppointmentDomainService(repository: appointmentDomainRepository);
  }
}