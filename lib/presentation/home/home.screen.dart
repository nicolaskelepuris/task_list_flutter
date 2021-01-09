import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/home/widgets/appbar_widget.dart';
import 'package:task_list_app/presentation/home/widgets/menu.widget.dart';
import 'package:task_list_app/presentation/home/widgets/mobile_appbar_widget.dart';
import 'package:task_list_app/presentation/home/widgets/pages.widget.dart';
import 'package:task_list_app/presentation/shared/loading/base.widget.dart';

import './controllers/home.controller.dart';
import 'widgets/background.widget.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BackgroundWidget(
        children: PlatformChecker.isMobile()
            ? buildHomeScreenForMobile()
            : [
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 20, 45, 0),
                  child: AppBarWidget(
                    onLogout: () async {
                      await controller.logoutUser();
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: MenuWidget(
                            headerLogo: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: PagesWidget(), flex: 4),
                      ],
                    ),
                  ),
                ),
              ],
      ),
    );
  }

  List<Widget> buildHomeScreenForMobile() {
    return [
      Expanded(
        child: Scaffold(
          appBar: MobileAppBarWidget(
            onLogout: () async {
              await controller.logoutUser();
            },
          ).build(),
          body: PagesWidget(),
          drawer: Drawer(
            child: MenuWidget(
              headerLogo: Image.asset('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    ];
  }
}
