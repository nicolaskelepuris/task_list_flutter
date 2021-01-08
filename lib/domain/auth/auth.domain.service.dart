import 'package:task_list_app/domain/auth/models/token.model.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
import 'package:flutter/foundation.dart';
import 'package:task_list_app/infrastructure/dal/services/data/user.data.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  final AuthDomainRepository _repository;
  const AuthDomainService({@required AuthDomainRepository repository})
      : _repository = repository;

  Future<UserModel> authenticateUser({
    @required String login,
    @required String password,
  }) async {
    try {
      var response = await _repository.validateUserPassword(
        login: login,
        password: password,
      );

      var token = TokenModel.fromData(response.token);
      token.save();

      var user = UserModel.fromData(response.user);
      await user.save();
      _repository.saveUsername(user.name);
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getCurrentUser() async {
    try {
      var response = await _repository.getCurrentUserInfo();
      var user = UserModel.fromData(response);
      await user.save();
      _repository.saveUsername(user.name);
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> registerUser({
    @required UserModel user,
    @required String password,
  }) async {
    try {
      return UserModel.fromData(await _repository.registerUser(
        name: user.name,
        email: user.email,
        password: password,
      ));
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> updateUser({@required UserModel user}) async {
    try {
      return UserModel.fromData(await _repository.updateUser(
        userData: UserData(
            id: user.id,
            name: user.name,
            email: user.email,
            isAdmin: user.isAdmin),
      ));
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> changePassword(
      {@required String currentPassword, @required String newPassword}) async {
    try {
      return UserModel.fromData(await _repository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ));
    } catch (err) {
      rethrow;
    }
  }

  Future<String> resetPassword({@required UserModel user}) async {
    try {
      return await _repository.resetPassword(
        userData: UserData(
            id: user.id,
            name: user.name,
            email: user.email,
            isAdmin: user.isAdmin),
      );
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> deleteUser({@required String id}) async {
    try {
      return await _repository.deleteUser(
        id: id,
      );
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUserInfo({@required String id}) async {
    try {
      var response = await _repository.getUserInfo(id: id);
      var user = UserModel.fromData(response);

      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersInfo() async {
    try {
      var response = await _repository.getUsersInfo();
      var users = response.map((e) => UserModel.fromData(e)).toList();

      return users;
    } catch (err) {
      rethrow;
    }
  }

  Future<String> getUsername() async {
    try {
      String username = _repository.getUsername();
      return username != null
          ? username
          : () async {
              var user = await getCurrentUser();
              return user.name;
            };
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      var hasToken = _repository.hasToken();
      if (hasToken) {
        var tokenData = _repository.getAuthToken();
        var token = TokenModel.fromData(tokenData);
        token.save();
      }

      var hasUser = await _repository.hasUserSaved();
      if (hasToken && hasUser) {
        return true;
      } else {
        await logoutUser();
      }
      return hasToken && hasUser;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await _repository.clearHive();
      await _repository.clearStorage();
    } catch (err) {
      rethrow;
    }
  }
}
