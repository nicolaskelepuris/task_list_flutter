import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/auth.domain.service.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
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
  void clearForm() {
    // TODO: implement clearForm
  }

  @override
  void closeRegisterScreen() {
    // TODO: implement closeRegisterScreen
  }

  @override
  Future<void> deleteItem() {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  void discardEditChanges() {
    // TODO: implement discardEditChanges
  }

  @override
  Future<List<UserModel>> getResources() {
    // TODO: implement getResources
    throw UnimplementedError();
  }

  @override
  void openEditScreen(UserModel item) {
    // TODO: implement openEditScreen
  }

  @override
  void openRegisterScreen() {
    // TODO: implement openRegisterScreen
  }

  @override
  void saveItem() {
    // TODO: implement saveItem
  }

  @override
  // TODO: implement validateRequiredFields
  bool get validateRequiredFields => throw UnimplementedError();
}
