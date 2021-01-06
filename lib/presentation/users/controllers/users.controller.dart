import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/auth.domain.service.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
import 'package:task_list_app/domain/core/utils/snackbar.util.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/helpers/input_validator.dart';
import 'package:task_list_app/presentation/shared/loading/loading.controller.dart';

import '../../../home_routes.dart';
import '../../../register_controller.dart';

class UsersController extends GetxController
    implements RegisterController<UserModel> {
  final AuthDomainService _authDomainService;
  final LoadingController _loadingController;
  UsersController({
    @required AuthDomainService authDomainService,
    @required LoadingController loadingController,
  })  : _authDomainService = authDomainService,
        _loadingController = loadingController;

  @override
  void onReady() async {
    try {
      super.onReady();
      loadUsers();
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    }
  }

  @override
  Future<List<UserModel>> getResources() async {
    try {
      _loadingController.isLoading = true;
      var users = await _authDomainService.getUsersInfo();
      return users;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      rethrow;
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void openRegisterScreen() {
    pageIndex.value = 1;
    Get.focusScope.unfocus();
  }

  @override
  void closeRegisterScreen() {
    pageIndex.value = 0;
    userToBeEdited = UserModel.blank();
    _userForm.value = UserModel.blank();
    Get.focusScope.unfocus();
    loadUsers();
  }

  @override
  void openEditScreen(UserModel user) {
    userToBeEdited = user.clone();
    _userForm.value = user.clone();
    openRegisterScreen();
  }

  @override
  void clearForm() {
    userToBeEdited = UserModel.blank();
    _userForm.value = UserModel.blank();
    Get.focusScope.unfocus();
  }

  @override
  void discardEditChanges() {
    openEditScreen(userToBeEdited.clone());
  }

  @override
  void saveItem() async {
    try {
      if (validateRequiredFields) {
        _loadingController.isLoading = true;

        userToBeEdited =
            userForm.id == null ? await _registerUser() : await _updateUser();

        Get.focusScope.unfocus();
      } else {
        SnackbarUtil.showWarning(
          message: 'Preencha os campos obrigatórios',
        );
      }
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<UserModel> _registerUser() async {
    try {
      var user = _authDomainService.registerUser(
          user: userForm, password: password.value);

      SnackbarUtil.showSuccess(message: 'User has been registered');
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> _updateUser() async {
    try {
      var user = _authDomainService.updateUser(user: userForm);

      SnackbarUtil.showSuccess(message: 'User has been updated');
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool get validateRequiredFields {
    return !InputValidator.isNullOrEmpty(userForm.name) &&
        !InputValidator.isNullOrEmpty(userForm.email) &&
        (InputValidator.isNullOrEmpty(userForm.id)
            ? !InputValidator.isNullOrEmpty(password.value)
            : true);
  }

  Future<void> loadUsers() async {
    var users = await getResources();
    this.users.assignAll(users);
  }

  final users = <UserModel>[].obs;

  UserModel userToBeEdited = UserModel.blank();

  final _userForm = UserModel.blank().obs;
  UserModel get userForm => _userForm.value;

  final password = ''.obs;

  final itemMenu = HomeRoutes.users;

  final pageIndex = 0.obs;

  @override
  Future<void> deleteItem() {
    throw UnimplementedError();
  }
}
