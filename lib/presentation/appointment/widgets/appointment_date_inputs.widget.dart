import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/core/enums/appointment_type.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/presentation/appointment_register/widgets/date_input.widget.dart';

class AppointmentDateInputsWidget extends StatelessWidget {
  final Appointment appointment;
  final bool hasInitialValue;
  AppointmentDateInputsWidget({this.appointment, this.hasInitialValue});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateInputWidget(
              label: 'ETA',
              onChanged: (date) =>
                  appointment.estimatedTimeOfArrival.value = date,
              dateInitialValue: appointment?.estimatedTimeOfArrival,
            ),
            DateInputWidget(
              label: 'ETB',
              onChanged: (date) =>
                  appointment.estimatedTimeOfBerthing.value = date,
              dateInitialValue: appointment?.estimatedTimeOfBerthing,
            ),
            DateInputWidget(
              label: 'ETS',
              onChanged: (date) =>
                  appointment.estimatedTimeOfSailing.value = date,
              dateInitialValue: appointment?.estimatedTimeOfSailing,
            ),
          ],
        ),
        SizedBox(
          width: 40.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateInputWidget(
              label: 'Arrival',
              onChanged: (date) => appointment.arrival.value = date,
              dateInitialValue: appointment?.arrival,
            ),
            DateInputWidget(
              label: 'Berthing',
              onChanged: (date) => appointment.berthing.value = date,
              dateInitialValue: appointment?.berthing,
            ),
            DateInputWidget(
              label: 'Sailing',
              onChanged: (date) => appointment.sailing.value = date,
              dateInitialValue: appointment?.sailing,
            ),
          ],
        ),
        Obx(() {
          return (appointment?.type?.value ?? AppointmentType.consigneeAgent) ==
                  AppointmentType.consigneeAgent
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DateInputWidget(
                      label: 'ETA on 1s brazilian port',
                      onChanged: (date) => appointment
                          .estimatedTimeOfArrivalOnFirstBrazillianPort
                          .value = date,
                      dateInitialValue: appointment
                          ?.estimatedTimeOfArrivalOnFirstBrazillianPort,
                    ),
                  ],
                )
              : SizedBox();
        }),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
