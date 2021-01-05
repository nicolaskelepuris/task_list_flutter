import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:task_list_app/infrastructure/dal/services/user/dto/get_user_info.response.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserService {
  final GetConnect _connect;
  UserService({@required GetConnect connect}) : _connect = connect;

  Future<GetUserInfoResponse> getUserInfo() async {
    var response = await _connect.get('users/current');

    if (!response.hasError) {
      var model = GetUserInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }
}
