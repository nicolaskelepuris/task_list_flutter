import 'package:flutter/foundation.dart';
import 'package:task_list_app/domain/vessel/vessel.domain.repository.dart';
import 'package:task_list_app/infrastructure/dal/services/data/vessel.data.dart';

import 'models/vessel.dart';

class VesselDomainService {
  final VesselDomainRepository _repository;
  const VesselDomainService({
    @required VesselDomainRepository repository,
  }) : _repository = repository;

  Future<List<Vessel>> getVesselsInfo() async {
    try {
      var vesselsData = await _repository.getVesselsInfo();
      return vesselsData.map((e) => Vessel.fromData(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<Vessel> getVesselInfo(int id) async {
    try {
      return Vessel.fromData(await _repository.getVesselInfo(id));
    } catch (err) {
      rethrow;
    }
  }

  Future<Vessel> registerVessel(
      {@required String name,
      @required String imo,
      @required String flag,
      @required double deadweight,
      @required double lengthOverall,
      @required double beam,
      @required double depth}) async {
    try {
      return Vessel.fromData(await _repository.registerVessel(
          name: name,
          imo: imo,
          flag: flag,
          deadweight: deadweight,
          lengthOverall: lengthOverall,
          beam: beam,
          depth: depth));
    } catch (err) {
      rethrow;
    }
  }

  Future<Vessel> updateVessel({@required Vessel vessel}) async {
    try {
      return Vessel.fromData(await _repository.updateVessel(
        vesselData: VesselData(
            id: vessel.id,
            name: vessel.name,
            imo: vessel.imo,
            flag: vessel.flag,
            deadweight: vessel.deadweight,
            lengthOverall: vessel.lengthOverall,
            beam: vessel.beam,
            depth: vessel.depth),
      ));
    } catch (err) {
      rethrow;
    }
  }
}
