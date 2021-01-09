import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
import 'package:task_list_app/presentation/appointments/widgets/cancel_button.widget.dart';
import 'package:task_list_app/presentation/shared/textfield/text_field.widget.dart';

class UserFormWidget extends StatelessWidget {
  final bool hasInitialValue;
  final UserModel user;
  final RxString password;
  final Function onResetPasswordButtonPressed;
  final Function onDeleteUserButtonPressed;
  UserFormWidget({
    @required this.hasInitialValue,
    @required this.user,
    this.password,
    this.onResetPasswordButtonPressed,
    this.onDeleteUserButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextFieldWidget(
              label: 'Name',
              textInitialValue: hasInitialValue ? user.name : null,
              onChanged: (val) => user.name = val,
              width: .2,
              requiredField: true,
            ),
            SizedBox(width: 40),
            TextFieldWidget(
              label: 'E-mail',
              width: .2,
              onChanged: (val) => user.email = val,
              textInitialValue: hasInitialValue ? user.email : null,
              requiredField: true,
            ),
            SizedBox(width: 40),
          ],
        ),
        !hasInitialValue
            ? Row(
                children: [
                  TextFieldWidget(
                    label: 'Password',
                    onChanged: (val) => password.value = val,
                    width: .2,
                    requiredField: true,
                    obscureText: true,
                    helperText: 'Use 5 or more letters, numbers or symbols',
                  ),
                ],
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CancelButtonWidget(
                    onTap: onResetPasswordButtonPressed,
                    buttonText: 'Reset password',
                    width: 130,
                  ),
                ),
              ),
        hasInitialValue
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CancelButtonWidget(
                    onTap: onDeleteUserButtonPressed,
                    buttonText: 'Delete user',
                    width: 130,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
