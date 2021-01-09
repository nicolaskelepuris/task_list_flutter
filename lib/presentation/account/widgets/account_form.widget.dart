import 'package:flutter/material.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/account/controllers/account.controller.dart';
import 'package:task_list_app/presentation/shared/textfield/text_field.widget.dart';

class AccountFormWidget extends StatelessWidget {
  final bool hasInitialValue;
  final UserModel user;
  final PasswordUpdateForm passwordUpdateForm;
  final bool isUpdatingPassword;
  AccountFormWidget(
      {@required this.hasInitialValue,
      @required this.user,
      this.passwordUpdateForm,
      this.isUpdatingPassword});

  @override
  Widget build(BuildContext context) {
    return PlatformChecker.isMobile()
        ? buildForMobile()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextFieldWidget(
                    enabled: false,
                    label: 'Name',
                    textInitialValue: hasInitialValue ? user.name : null,
                    onChanged: (val) => user.name = val,
                    width: .2,
                  ),
                  SizedBox(width: 40),
                  TextFieldWidget(
                    enabled: false,
                    label: 'Email',
                    width: .2,
                    onChanged: (val) => user.email = val,
                    textInitialValue: hasInitialValue ? user.email : null,
                  ),
                ],
              ),
              isUpdatingPassword
                  ? Column(
                      children: [
                        TextFieldWidget(
                          textInitialValue:
                              passwordUpdateForm.currentPassword.value,
                          label: 'Current password',
                          onChanged: (val) =>
                              passwordUpdateForm.currentPassword.value = val,
                          width: .2,
                          requiredField: true,
                          obscureText: true,
                        ),
                        TextFieldWidget(
                          textInitialValue:
                              passwordUpdateForm.newPassword.value,
                          label: 'New password',
                          onChanged: (val) =>
                              passwordUpdateForm.newPassword.value = val,
                          width: .2,
                          requiredField: true,
                          obscureText: true,
                          helperText:
                              'Use 5 or more letters, numbers or symbols',
                        ),
                        TextFieldWidget(
                          textInitialValue:
                              passwordUpdateForm.confirmPassword.value,
                          label: 'Confirm password',
                          onChanged: (val) =>
                              passwordUpdateForm.confirmPassword.value = val,
                          width: .2,
                          requiredField: true,
                          obscureText: true,
                          helperText: 'Must match new password',
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          );
  }

  Widget buildForMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          enabled: false,
          label: 'Name',
          textInitialValue: hasInitialValue ? user.name : null,
          onChanged: (val) => user.name = val,
          width: .2,
        ),
        TextFieldWidget(
          enabled: false,
          label: 'Email',
          width: .2,
          onChanged: (val) => user.email = val,
          textInitialValue: hasInitialValue ? user.email : null,
        ),
        isUpdatingPassword
            ? Column(
                children: [
                  TextFieldWidget(
                    textInitialValue: passwordUpdateForm.currentPassword.value,
                    label: 'Current password',
                    onChanged: (val) =>
                        passwordUpdateForm.currentPassword.value = val,
                    width: .2,
                    requiredField: true,
                    obscureText: true,
                  ),
                  TextFieldWidget(
                    textInitialValue: passwordUpdateForm.newPassword.value,
                    label: 'New password',
                    onChanged: (val) =>
                        passwordUpdateForm.newPassword.value = val,
                    width: .2,
                    requiredField: true,
                    obscureText: true,
                    helperText: 'Use 5 or more letters, numbers or symbols',
                  ),
                  TextFieldWidget(
                    textInitialValue: passwordUpdateForm.confirmPassword.value,
                    label: 'Confirm password',
                    onChanged: (val) =>
                        passwordUpdateForm.confirmPassword.value = val,
                    width: .2,
                    requiredField: true,
                    obscureText: true,
                    helperText: 'Must match new password',
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
