import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentRegisterCheckboxInputWidget extends StatelessWidget {
  AppointmentRegisterCheckboxInputWidget(
      {this.text, this.value, this.onchanged, this.editEnabled});
  final RxBool value;
  final void Function(bool) onchanged;
  final String text;
  final RxBool editEnabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(text),
          Obx(() {
            return Checkbox(
              value: value.value,
              onChanged: (editEnabled?.value == null || editEnabled.value) ? onchanged : null,
            );
          }),
        ],
      ),
    );
  }
}
