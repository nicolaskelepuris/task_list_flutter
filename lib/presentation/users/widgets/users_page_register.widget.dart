import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/core/utils/dialog.util.dart';
import 'package:task_list_app/presentation/appointments/widgets/cancel_button.widget.dart';
import 'package:task_list_app/presentation/appointments/widgets/new_button.widget.dart';
import 'package:task_list_app/presentation/users/controllers/users.controller.dart';
import 'package:task_list_app/presentation/users/widgets/user_form.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/page_header.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/save_button.widget.dart';
import 'package:task_list_app/presentation/vessels/widgets/vessel_form.widget.dart';

class UsersPageRegisterWidget extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeaderWidget(
          onBackPressed: controller.closeRegisterScreen,
          options: [
            NewButtonWidget(
              onTap: controller.clearForm,
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
                  var user = controller.userForm;
                  var hasInitialValue = user.id != null;

                  return UserFormWidget(
                    user: user,
                    hasInitialValue: hasInitialValue,
                    password: controller.password,
                    onResetPasswordButtonPressed: () async {
                      var password = await controller.resetPassword(
                          user: controller.userToBeEdited);
                      if (password != null && password.isNotEmpty) {
                        DialogUtil.showAlertDialog(
                            context,
                            'Password has been reset',
                            'New password for ${user.name}: $password');
                      }
                    },
                    onDeleteUserButtonPressed: () async {
                      await controller.deleteUser(
                          user: controller.userToBeEdited);
                      controller.clearForm();
                    },
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
