import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/appointments/widgets/cancel_button.widget.dart';
import 'package:task_list_app/presentation/appointments/widgets/new_button.widget.dart';
import 'package:task_list_app/presentation/vessels/controllers/vessels.controller.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/save_button.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/vessel_form.widget.dart';

class PageRegisterWidget extends GetView<VesselsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeaderWidget(
          onBackPressed: controller.closeRegisterScreen,
          options: PlatformChecker.isMobile()
              ? [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      size: 28,
                    ),
                    onPressed: controller.clearForm,
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.clear,
                      size: 28,
                    ),
                    onPressed: controller.discardEditChanges,
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.save_alt,
                      size: 28,
                    ),
                    onPressed: controller.saveItem,
                  ),
                ]
              : [
                  NewButtonWidget(
                    onTap: controller.clearForm,
                    buttonText: 'Clear',
                  ),
                  SizedBox(width: 20),
                  CancelButtonWidget(onTap: controller.discardEditChanges),
                  SizedBox(width: 20),
                  SaveButtonWidget(onTap: controller.saveItem),
                ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: Obx(
                () {
                  var vessel = controller.vesselForm;
                  var hasInitialValue = vessel.id != null;

                  return VesselFormWidget(
                    vessel: vessel,
                    hasInitialValue: hasInitialValue,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
