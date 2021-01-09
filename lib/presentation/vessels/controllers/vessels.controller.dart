import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/core/utils/snackbar.util.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/domain/vessel/vessel.domain.service.dart';
import 'package:task_list_app/helpers/input_validator.dart';
import 'package:task_list_app/presentation/shared/loading/loading.controller.dart';

import '../../../home_routes.dart';
import '../../../register_controller.dart';

class VesselsController extends GetxController
    implements RegisterController<Vessel> {
  final VesselDomainService _vesselDomainService;
  final LoadingController _loadingController;
  VesselsController({
    @required VesselDomainService vesselDomainService,
    @required LoadingController loadingController,
  })  : _vesselDomainService = vesselDomainService,
        _loadingController = loadingController;

  @override
  void onReady() async {
    try {
      super.onReady();
      loadVessels();
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    }
  }

  @override
  Future<List<Vessel>> getResources() async {
    try {
      _loadingController.isLoading = true;
      var vessels = await _vesselDomainService.getVesselsInfo();
      return vessels;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
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
    vesselToBeEdited = Vessel.blank();
    _vesselForm.value = Vessel.blank();
    Get.focusScope.unfocus();
    loadVessels();
  }

  @override
  void openEditScreen(Vessel vessel) {
    vesselToBeEdited = vessel.clone();
    _vesselForm.value = vessel.clone();
    openRegisterScreen();
  }

  @override
  void clearForm() {
    vesselToBeEdited = Vessel.blank();
    _vesselForm.value = Vessel.blank();
    Get.focusScope.unfocus();
  }

  @override
  void discardEditChanges() {
    openEditScreen(vesselToBeEdited.clone());
  }

  @override
  void saveItem() async {
    try {
      if (validateRequiredFields) {
        if (validateNotRequiredFields()) {
          _loadingController.isLoading = true;

          vesselToBeEdited = vesselForm.id == null
              ? await _registerVessel()
              : await _updateVessel();

          Get.focusScope.unfocus();
        }
      } else {
        SnackbarUtil.showWarning(
          message: 'All required fields must be filled',
        );
      }
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  Future<Vessel> _registerVessel() async {
    try {
      var vessel = await _vesselDomainService.registerVessel(
        name: vesselForm.name,
        imo: vesselForm.imo,
        flag: vesselForm.flag,
        deadweight: vesselForm.deadweight,
        lengthOverall: vesselForm.lengthOverall,
        beam: vesselForm.beam,
        depth: vesselForm.depth,
      );

      SnackbarUtil.showSuccess(
          message: 'Vessel "${vessel.name}" has been registered');
      return vessel;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    }
  }

  Future<Vessel> _updateVessel() async {
    try {
      var vessel = await _vesselDomainService.updateVessel(vessel: vesselForm);

      SnackbarUtil.showSuccess(
          message: 'Vessel "${vessel.name}" has been updated');
      return vessel;
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
      return null;
    }
  }

  @override
  bool get validateRequiredFields {
    return !InputValidator.isNullOrEmpty(vesselForm.name) &&
        !InputValidator.isNullOrEmpty(vesselForm.imo) &&
        !InputValidator.isNullOrEmpty(vesselForm.flag);
  }

  bool validateNotRequiredFields() {
    var fieldsWithError = <String>[];

    if (vesselForm.deadweight == null) {
      fieldsWithError.add('Deadweight');
    }
    if (vesselForm.lengthOverall == null) {
      fieldsWithError.add('LOA');
    }
    if (vesselForm.beam == null) {
      fieldsWithError.add('Beam');
    }
    if (vesselForm.depth == null) {
      fieldsWithError.add('Depth');
    }

    if (fieldsWithError.isNotEmpty) {
      var errorsFields = '"${fieldsWithError[0]}"';
      if (fieldsWithError.length == 1) {
        SnackbarUtil.showWarning(
          message: '$errorsFields must be correctly filled',
        );
      } else {
        for (var i = 1; i < fieldsWithError.length; i++) {
          errorsFields = '$errorsFields, "${fieldsWithError[i]}"';
        }

        SnackbarUtil.showWarning(
          message: '$errorsFields must be correctly filled',
        );
      }
    }

    return fieldsWithError.isEmpty;
  }

  Future<void> loadVessels() async {
    var vessels = await getResources();
    if (vessels != null) this.vessels.assignAll(vessels);
  }

  final vessels = <Vessel>[].obs;

  Vessel vesselToBeEdited = Vessel.blank();

  final _vesselForm = Vessel.blank().obs;
  Vessel get vesselForm => _vesselForm.value;

  final itemMenu = HomeRoutes.vessels;

  final pageIndex = 0.obs;

  @override
  Future<void> deleteItem() {
    throw UnimplementedError();
  }
}
