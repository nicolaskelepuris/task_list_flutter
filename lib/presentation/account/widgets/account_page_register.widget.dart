import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/account/controllers/account.controller.dart';
import 'package:task_list_app/presentation/appointments/widgets/cancel_button.widget.dart';
import 'package:task_list_app/presentation/appointments/widgets/new_button.widget.dart';
import 'package:task_list_app/presentation/users/widgets/user_form.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/save_button.widget.dart';

import 'account_form.widget.dart';

class AccountPageRegisterWidget extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return controller.updatingPassword.value
              ? PageHeaderWidget(
                  onBackPressed: () {
                    controller.updatingPassword.value = false;
                    controller.discardEditChanges();
                  },
                  options: [
                    CancelButtonWidget(onTap: controller.discardEditChanges),
                    SizedBox(width: 20),
                    SaveButtonWidget(onTap: controller.saveItem),
                  ],
                )
              : PageHeaderWidget(
                  options: [
                    NewButtonWidget(
                        onTap: () => controller.updatingPassword.value = true, buttonText: 'Change password', width: 110,),
                  ],
                );
        }),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: Obx(
                () {
                  var user = controller.user.value;
                  var hasInitialValue = user?.id != null;
                  var passwordUpdateForm = controller.passwordUpdateForm;
                  var isUpdatingPassword = controller.updatingPassword.value;

                  return AccountFormWidget(
                    user: user,
                    hasInitialValue: hasInitialValue,
                    passwordUpdateForm: passwordUpdateForm,
                    isUpdatingPassword: isUpdatingPassword,
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
