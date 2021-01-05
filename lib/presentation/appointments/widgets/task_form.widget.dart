import 'package:flutter/material.dart';
import 'package:task_list_app/domain/core/enums/task_status.dart';
import 'package:task_list_app/domain/core/enums/whent_to_complete.dart';
import 'package:task_list_app/domain/core/utils/enum.util.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/domain/vessel/models/task.dart';
import 'package:task_list_app/presentation/appointment_register/widgets/date_input.widget.dart';
import 'package:task_list_app/presentation/appointment_register/widgets/enum_input.widget.dart';
import 'package:task_list_app/presentation/shared/textfield/text_field.widget.dart';

class TaskFormWidget extends StatelessWidget {
  final bool hasInitialValue;
  final Task task;
  final List<Appointment> appointments;
  Appointment appointmentSelected;
  TaskFormWidget({
    @required this.hasInitialValue,
    @required this.task,
    @required this.appointments,
    @required this.appointmentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            EnumInputWidget<TaskStatus>(
              title: 'Status',
              items: TaskStatus.values,
              currentValue: task?.status?.value,
              onChange: (status) => task.status.value = status,
              itemName: EnumUtil.taskStatusToString,
              placeholder: EnumUtil.taskStatusToString(task?.status?.value),
            ),
            EnumInputWidget<Appointment>(
              title: 'Appointment',
              items: appointments ?? [],
              currentValue: appointmentSelected,
              onChange: (appointment) {
                task.appointmentId.value = appointment.id.value;
                appointmentSelected = appointment;
              },
              itemName: (appointment) {
                return appointment?.id?.value != null
                    ? '${appointment?.vesselName?.value} at ${appointment?.appointmentPort}'
                    : '';
              },
              placeholder: '',
            ),
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldWidget(
              label: 'Name',
              width: .25,
              textInitialValue: hasInitialValue ? task.name.value : null,
              onChanged: (val) => task.name.value = val,
              requiredField: true,
            ),
            SizedBox(width: 40),
            TextFieldWidget(
              label: 'Description',
              width: .25,
              textInitialValue: hasInitialValue ? task.description.value : null,
              onChanged: (val) => task.description.value = val,
              requiredField: true,
            ),
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DateInputWidget(
              label: 'Deadline',
              onChanged: (date) => task.deadline.value = date,
              dateInitialValue: task?.deadline,
            ),
            EnumInputWidget<WhenToComplete>(
              title: 'When to complete?',
              items: WhenToComplete.values,
              currentValue: task?.whenToComplete?.value,
              onChange: (val) => task.whenToComplete.value = val,
              itemName: EnumUtil.taskWhenToCompleteToString,
              placeholder: EnumUtil.taskWhenToCompleteToString(
                  task?.whenToComplete?.value),
            ),
          ],
        ),
      ],
    );
  }
}
