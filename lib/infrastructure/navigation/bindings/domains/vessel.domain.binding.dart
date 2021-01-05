import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_list_app/domain/vessel/vessel.domain.repository.dart';
import 'package:task_list_app/domain/vessel/vessel.domain.service.dart';
import 'package:task_list_app/infrastructure/dal/services/vessels/vessels.service.dart';

class VesselDomainBinding {
  VesselDomainService _vesselDomainService;
  VesselDomainService get domain => _vesselDomainService;

  VesselDomainBinding() {
    GetConnect connect = Get.find();
    GetStorage storage = Get.find();
    
    var vesselsService = VesselsService(connect: connect);
    var vesselDomainRepository = VesselDomainRepository(
      vesselsService: vesselsService,
      storage: storage
    );
    _vesselDomainService = VesselDomainService(repository: vesselDomainRepository);
  }
}