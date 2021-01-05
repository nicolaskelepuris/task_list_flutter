import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_list_app/domain/core/constants/storage.constants.dart';
import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:task_list_app/infrastructure/dal/services/data/vessel.data.dart';
import 'package:task_list_app/infrastructure/dal/services/vessels/dto/register_vessel.body.dart';
import 'package:task_list_app/infrastructure/dal/services/vessels/vessels.service.dart';

class VesselDomainRepository {
  final VesselsService _vesselsService;
  final GetStorage _storage;
  const VesselDomainRepository({
    @required VesselsService vesselsService,
    @required GetStorage storage,
  })  : _vesselsService = vesselsService,
        _storage = storage;

  Future<List<VesselData>> getVesselsInfo() async {
    try {
      var response = await _vesselsService.getVesselsInfo();
      if (response.success) {
        return response.data.vessels;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<VesselData> getVesselInfo(int id) async {
    try {
      var response = await _vesselsService.getVesselInfo(id);
      if (response.success) {
        return response.data.vessel;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<VesselData> registerVessel(
      {@required String name,
      @required String imo,
      @required String flag,
      @required double deadweight,
      @required double lengthOverall,
      @required double beam,
      @required double depth}) async {
    try {
      var body = RegisterVesselBody(
          name: name,
          imo: imo,
          flag: flag,
          deadweight: deadweight,
          lengthOverall: lengthOverall,
          beam: beam,
          depth: depth);

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _vesselsService.registerVessel(body, token);

      if (response.success) {
        return response.data.vessel;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<VesselData> updateVessel(
      {@required VesselData vesselData}) async {
    try {
      var body = RegisterVesselBody(
          name: vesselData.name,
          imo: vesselData.imo,
          flag: vesselData.flag,
          deadweight: vesselData.deadweight,
          lengthOverall: vesselData.lengthOverall,
          beam: vesselData.beam,
          depth: vesselData.depth);

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _vesselsService.updateVessel(body: body, token: token, id: vesselData.id);

      if (response.success) {
        return response.data.vessel;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }
}
