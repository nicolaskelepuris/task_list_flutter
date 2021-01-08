import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/auth.domain.service.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
import 'package:task_list_app/domain/core/utils/snackbar.util.dart';
import 'package:task_list_app/helpers/input_validator.dart';
import 'package:task_list_app/presentation/shared/loading/loading.controller.dart';

import '../../../register_controller.dart';

class AccountController extends GetxController
    implements RegisterController<UserModel> {
  final AuthDomainService _authDomainService;
  final LoadingController _loadingController;
  AccountController({
    @required AuthDomainService authDomainService,
    @required LoadingController loadingController,
  })  : _authDomainService = authDomainService,
        _loadingController = loadingController;

  @override
  void onReady() async {
    try {
      super.onReady();
      loadUser();
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    }
  }

  @override
  void clearForm() {}

  @override
  void closeRegisterScreen() {}

  @override
  Future<void> deleteItem() {
    throw UnimplementedError();
  }

  @override
  void discardEditChanges() {
    _passwordUpdateForm.value = PasswordUpdateForm.blank();
  }

  Future<UserModel> getUser() async {
    try {
      _loadingController.isLoading = true;
      var user = await _authDomainService.getCurrentUser();
      return user;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      rethrow;
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<void> loadUser() async {
    this.user.value = await getUser();
  }

  final user = Rx<UserModel>();

  final _passwordUpdateForm = PasswordUpdateForm.blank().obs;
  PasswordUpdateForm get passwordUpdateForm => _passwordUpdateForm.value;

  @override
  void openEditScreen(UserModel item) {}

  @override
  void openRegisterScreen() {}

  final updatingPassword = RxBool(false);

  @override
  Future<void> saveItem() async {
    try {
      if (validateRequiredFields) {
        if (newPasswordAndConfirmPasswordMatch()) {
          _loadingController.isLoading = true;

          await _authDomainService.changePassword(
            currentPassword: passwordUpdateForm.currentPassword.value,
            newPassword: passwordUpdateForm.newPassword.value,
          );

          SnackbarUtil.showSuccess(
            message: 'Password has been changed',
          );

          Get.focusScope.unfocus();
        }
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

  @override
  bool get validateRequiredFields {
    return !InputValidator.isNullOrEmpty(
            passwordUpdateForm.currentPassword.value) &&
        !InputValidator.isNullOrEmpty(passwordUpdateForm.newPassword.value) &&
        !InputValidator.isNullOrEmpty(passwordUpdateForm.confirmPassword.value);
  }

  bool newPasswordAndConfirmPasswordMatch() {
    var passwordsMatch = passwordUpdateForm.newPassword.value ==
        passwordUpdateForm.confirmPassword.value;

    if (!passwordsMatch) {
      SnackbarUtil.showWarning(
        message: 'New password and confirm password must match',
      );
    }

    return passwordsMatch;
  }

  @override
  Future<List<UserModel>> getResources() {
    throw UnimplementedError();
  }
}

class PasswordUpdateForm {
  RxString currentPassword;
  RxString newPassword;
  RxString confirmPassword;

  PasswordUpdateForm(
      {this.currentPassword, this.newPassword, this.confirmPassword});

  factory PasswordUpdateForm.blank() {
    return PasswordUpdateForm(
      currentPassword: ''.obs,
      newPassword: ''.obs,
      confirmPassword: ''.obs,
    );
  }
}
