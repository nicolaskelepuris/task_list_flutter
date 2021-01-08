import 'package:task_list_app/domain/core/constants/storage.constants.dart';
import 'package:task_list_app/domain/core/exceptions/default.exception.dart';
import 'package:task_list_app/infrastructure/dal/daos/user.dao.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/auth.service.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/data/token.data.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/dto/authenticate_user.body.dart';
import 'package:task_list_app/infrastructure/dal/services/auth/dto/authenticate_user.response.dart';
import 'package:task_list_app/infrastructure/dal/services/data/user.data.dart';
import 'package:task_list_app/infrastructure/dal/services/user/dto/change_password.body.dart';
import 'package:task_list_app/infrastructure/dal/services/user/dto/register_user.body.dart';
import 'package:task_list_app/infrastructure/dal/services/user/user.service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class AuthDomainRepository {
  final AuthService _authService;
  final UserService _userService;
  final GetStorage _storage;

  const AuthDomainRepository({
    @required AuthService authService,
    @required UserService userService,
    @required GetStorage storage,
  })  : _authService = authService,
        _userService = userService,
        _storage = storage;

  Future<DataResponse> validateUserPassword({
    @required String login,
    @required String password,
  }) async {
    try {
      var body = AuthenticateUserBody(login: login, password: password);
      var response = await _authService.authenticateUser(body);
      if (response.success) {
        return response.data;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<UserData> getCurrentUserInfo() async {
    try {
      var response = await _userService.getCurrentUserInfo();
      if (response.success) {
        return response.data.user;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<UserData> registerUser({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    try {
      var body = RegisterUserBody(
        name: name,
        email: email,
        password: password,
      );

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _userService.registerUser(body, token);

      if (response.success) {
        return response.data.user;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<UserData> updateUser({@required UserData userData}) async {
    try {
      var body = RegisterUserBody(
        name: userData.name,
        email: userData.email,
      );

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _userService.updateUser(
          body: body, token: token, id: userData.id);

      if (response.success) {
        return response.data.user;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<UserData> changePassword(
      {@required String currentPassword, @required String newPassword}) async {
    try {
      var body = ChangePasswordBody(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _userService.changePassword(
        body: body,
        token: token,
      );

      if (response.success) {
        return response.data.user;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<String> resetPassword({@required UserData userData}) async {
    try {
      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var response = await _userService.resetPassword(
        token: token,
        id: userData.id,
      );

      if (response.success) {
        return response.data.password;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> deleteUser({@required String id}) async {
    try {
      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);

      var successResponse = await _userService.deleteUser(
        token: token,
        id: id,
      );

      return successResponse;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserData> getUserInfo({@required String id}) async {
    try {
      var response = await _userService.getUserInfo(id: id);
      if (response.success) {
        return response.data.user;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<List<UserData>> getUsersInfo() async {
    try {
      var response = await _userService.getUsersInfo();
      if (response.success) {
        return response.data.users;
      } else {
        throw DefaultException(message: response.error.message);
      }
    } catch (err) {
      rethrow;
    }
  }

  bool hasUsernameSaved() {
    try {
      return _storage.hasData(StorageConstants.USER_NAME);
    } catch (err) {
      rethrow;
    }
  }

  void saveUsername(String username) {
    try {
      _storage.write(StorageConstants.USER_NAME, username);
    } catch (err) {
      rethrow;
    }
  }

  String getUsername() {
    try {
      if (hasUsernameSaved()) {
        return _storage.read(StorageConstants.USER_NAME);
      } else {
        return null;
      }
    } catch (err) {
      rethrow;
    }
  }

  bool hasToken() {
    try {
      return _storage.hasData(StorageConstants.TOKEN_AUTHORIZATION);
    } catch (err) {
      rethrow;
    }
  }

  TokenData getAuthToken() {
    try {
      final token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);
      final expiration = _storage.read(StorageConstants.TOKEN_EXPIRATION);
      return TokenData(token: token, expiration: DateTime.parse(expiration));
    } catch (err) {
      rethrow;
    }
  }

  Future<UserDao> getSavedUser() async {
    try {
      var users = await UserDao().selectAll();
      return users.first;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> hasUserSaved() async {
    try {
      var users = await UserDao().selectAll();
      return users.isNotEmpty;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> clearStorage() async {
    try {
      await _storage.erase();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> clearHive() async {
    try {
      await UserDao().clear();
    } catch (err) {
      rethrow;
    }
  }
}
