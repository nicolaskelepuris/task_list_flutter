import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:task_list_app/domain/core/exceptions/user_not_found.exception.dart';
import 'package:task_list_app/infrastructure/translate/login.translate.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';

import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

class AuthService {
  final GetConnect _connect;
  AuthService({@required GetConnect connect}) : _connect = connect;

  Future<AuthenticateUserResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    var response = await _connect.post('auth/login', body.toJson());

    if (!response.hasError) {
      var model = AuthenticateUserResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException(
            message: LoginTranslate.userPasswordWrongSnackbar,
          );
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }
}
