import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/auth/models/user.model.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/helpers/input_validator.dart';
import 'package:task_list_app/presentation/shared/textfield/text_field.widget.dart';

class UserFormWidget extends StatelessWidget {
  final bool hasInitialValue;
  final UserModel user;
  final RxString password;
  UserFormWidget(
      {@required this.hasInitialValue, @required this.user, this.password});

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
              label: 'Email',
              width: .2,
              onChanged: (val) => user.email = val,
              textInitialValue: hasInitialValue ? user.email : null,
              requiredField: true,
            ),
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
            : SizedBox(),
      ],
    );
  }
}