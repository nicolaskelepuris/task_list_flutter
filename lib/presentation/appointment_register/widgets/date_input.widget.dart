import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/presentation/shared/textfield/text_field.widget.dart';
import 'package:task_list_app/presentation/shared/textfield/type_text_field.enum.dart';

class DateInputWidget extends StatelessWidget {
  final void Function(DateTime) onChanged;
  final String label;
  final Rx<DateTime> dateInitialValue;
  DateInputWidget({
    this.label,
    this.onChanged,
    this.dateInitialValue,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 230),
      child: TextFieldWidget(
        label: label,
        type: TypeTextField.DATE,
        onDateChanged: onChanged,
        dateInitialValue: dateInitialValue,
        width: 0.1,
      ),
    );
  }
}
