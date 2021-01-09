import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:task_list_app/infrastructure/dal/services/user/dto/get_reset_password_info.response.dart';
import 'package:task_list_app/infrastructure/dal/services/user/dto/get_user_info.response.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_list_app/infrastructure/dal/services/user/dto/get_users_info.response.dart';

import 'dto/change_password.body.dart';
import 'dto/register_user.body.dart';

class UserService {
  final GetConnect _connect;
  UserService({@required GetConnect connect}) : _connect = connect;

  Future<GetUserInfoResponse> getUserInfo({@required String id}) async {
    var response = await _connect.get('users/$id');

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

  Future<GetUsersInfoResponse> getUsersInfo() async {
    var response = await _connect.get('users');

    if (!response.hasError) {
      var model = GetUsersInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }

  Future<GetUserInfoResponse> getCurrentUserInfo() async {
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

  Future<GetUserInfoResponse> registerUser(
      RegisterUserBody body, String token) async {
    var response = await _connect.post('users', body.toJson(),
        headers: {'Authorization': 'Bearer $token'});

    if (!response.hasError) {
      var model = GetUserInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<GetUserInfoResponse> updateUser(
      {RegisterUserBody body, String token, String id}) async {
    var response = await _connect.put('users/$id', body.toJson(),
        headers: {'Authorization': 'Bearer $token'});

    if (!response.hasError) {
      var model = GetUserInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<GetUserInfoResponse> changePassword(
      {ChangePasswordBody body, String token}) async {
    var response = await _connect.put('users/password', body.toJson(),
        headers: {'Authorization': 'Bearer $token'});

    if (!response.hasError) {
      var model = GetUserInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<GetResetPasswordInfoResponse> resetPassword(
      {String token, String id}) async {
    var response = await _connect.post('users/$id/password_reset', {},
        headers: {'Authorization': 'Bearer $token'});

    if (!response.hasError) {
      var model = GetResetPasswordInfoResponse.fromJson(response.body);
      return model;
    } else {
      throw DefaultException(message: response.statusText);
    }
  }

  Future<bool> deleteUser({String token, String id}) async {
    var response = await _connect
        .delete('users/$id', headers: {'Authorization': 'Bearer $token'});

    return !response.hasError
        ? true
        : throw DefaultException(message: response.statusText);
  }
}
