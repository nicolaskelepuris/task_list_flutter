import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/dal/services/vessels/dto/get_vessel_info.response.dart';

import 'dto/get_vessels_info.response.dart';
import 'dto/register_vessel.body.dart';

class VesselsService {
  final GetConnect _connect;
  VesselsService({@required GetConnect connect}) : _connect = connect;

  Future<GetVesselsInfoResponse> getVesselsInfo() async {
    var response = await _connect.get('vessels');

    if (!response.hasError) {
      var model = GetVesselsInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }

  Future<GetVesselInfoResponse> getVesselInfo(int id) async {
    var response = await _connect.get('vessels/$id');

    if (!response.hasError) {
      var model = GetVesselInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }

  Future<GetVesselInfoResponse> registerVessel(
    RegisterVesselBody body,
    String token
  ) async {
    var response = await _connect.post('vessels', body.toJson(), headers: {'Authorization' : 'Bearer $token'});

    if (!response.hasError) {
      var model = GetVesselInfoResponse.fromJson(response.body);
      return model;
    } else {
          throw DefaultException(message: response.statusText);      
    }
  }

  Future<GetVesselInfoResponse> updateVessel(
    {RegisterVesselBody body,
    String token,
    int id}
  ) async {
    var response = await _connect.put('vessels/$id', body.toJson(), headers: {'Authorization' : 'Bearer $token'});

    if (!response.hasError) {
      var model = GetVesselInfoResponse.fromJson(response.body);
      return model;
    } else {
          throw DefaultException(message: response.statusText);      
    }
  }
}