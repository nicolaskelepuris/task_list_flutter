import 'package:task_list_app/infrastructure/dal/services/data/vessel.data.dart';

class Vessel {
  int id;
  String name;
  String imo;
  String flag;
  double deadweight;
  double lengthOverall;
  double beam;
  double depth;

  Vessel({
    this.id,
    this.name,
    this.imo,
    this.flag,
    this.deadweight,
    this.lengthOverall,
    this.beam,
    this.depth,
  });

  factory Vessel.fromData(VesselData vesselData) {
    return Vessel(
      id: vesselData.id,
      name: vesselData.name,
      imo: vesselData.imo,
      flag: vesselData.flag,
      deadweight: vesselData.deadweight,
      lengthOverall: vesselData.lengthOverall,
      beam: vesselData.beam,
      depth: vesselData.depth,
    );
  }

  factory Vessel.blank() {
    return Vessel(
      deadweight: 0,
      lengthOverall: 0,
      beam: 0,
      depth: 0,
    );
  }

  Vessel clone() {
    return Vessel(
      id: id,
      name: name,
      imo: imo,
      flag: flag,
      deadweight: deadweight,
      lengthOverall: lengthOverall,
      beam: beam,
      depth: depth,
    );
  }
}
