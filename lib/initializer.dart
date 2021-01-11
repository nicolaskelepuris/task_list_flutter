import 'package:task_list_app/domain/core/utils/snackbar.util.dart';
import 'package:task_list_app/infrastructure/dal/daos/user.dao.dart';
import 'package:task_list_app/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:task_list_app/presentation/home/widgets/menu_item_route.widget.dart';
import 'package:task_list_app/presentation/home/widgets/pages.controller.dart';

import 'config.dart';
import 'domain/core/utils/menu.util.dart';
import 'home_routes.dart';
import 'infrastructure/navigation/routes.dart';
import 'presentation/shared/loading/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initStorage();
      _initGetConnect();
      _initMenu();
      _initGlobalLoading();
      _initScreenPreference();
      await _initHive();
    } catch (err) {
      rethrow;
    }
  }

  static void _initGetConnect() async {
    var connect = GetConnect();
    var url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = Duration(seconds: 10);
    connect.httpClient.maxAuthRetries = 0;

    connect.httpClient.addResponseModifier(
      (request, response) async {
        if (response.statusCode == 401) {
          var authDomainBinding = AuthDomainBinding();
          await authDomainBinding.domain.logoutUser();
          Get.offAllNamed(Routes.LOGIN);
          SnackbarUtil.showWarning(
            message: 'Please login again',
          );
        }
      },
    );

    Logger().i('Conectado em: $url');
    Get.put(connect);
  }

  static void _initGlobalLoading() {
    var loading = LoadingController();
    Get.put(loading);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());
  }

  static Future<void> _initHive() async {
    if (!GetPlatform.isWeb) {
      var dir = await getApplicationDocumentsDirectory();
      Hive
        ..init(dir.path)
        ..registerAdapter(UserDaoAdapter());
    }
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void _initMenu() {
    initWeb(
      itensMenu: [
        HomeRoutes.dashboard,
        HomeRoutes.vessels,
        HomeRoutes.appointments,
        HomeRoutes.taskRegister,
      ],
    );
  }

  static Future<void> initWeb({@required List<MenuItemRoute> itensMenu}) async {
    try {
      _initPages(itensMenu);
      _initMenuPage();
    } catch (err) {
      rethrow;
    }
  }

  static void _initPages(List<MenuItemRoute> itensMenu) {
    MenuUtil.allItens.addAll(itensMenu);
  }

  static void _initMenuPage() {
    Get.put(PagesController());
  }
}
