import 'package:flutter/material.dart';
import 'package:task_list_app/domain/core/enums/appointment_status.dart';
import 'package:task_list_app/domain/core/enums/appointment_type.dart';
import 'package:task_list_app/domain/core/enums/operation_type.dart';
import 'package:task_list_app/domain/core/enums/port.dart';
import 'package:task_list_app/domain/core/utils/enum.util.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/presentation/appointment_register/widgets/enum_input.widget.dart';

class AppointmentEnumInputsWidget extends StatelessWidget {
  final Appointment appointment;
  final List<Vessel> vessels;
  Vessel vesselSelected;
  AppointmentEnumInputsWidget({
    this.appointment,
    this.vessels,
    this.vesselSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            EnumInputWidget<AppointmentStatus>(
              title: 'Status',
              items: AppointmentStatus.values,
              currentValue: appointment?.status?.value,
              onChange: (status) => appointment.status.value = status,
              itemName: EnumUtil.appointmentStatusToString,
              placeholder:
                  EnumUtil.appointmentStatusToString(appointment?.status?.value),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            EnumInputWidget<AppointmentType>(
              title: 'Appointment Type',
              items: AppointmentType.values,
              currentValue: appointment?.type?.value,
              onChange: (type) {
                appointment.type.value = type;
                appointment.hasCrewChange.value =
                    appointment.hasCrewChange.value ||
                        type == AppointmentType.crewChange;
              },
              itemName: EnumUtil.appointmentTypeToString,
              placeholder: EnumUtil.appointmentTypeToString(appointment?.type?.value),
            ),
            SizedBox(width: 40.0),
            EnumInputWidget<Vessel>(
              title: 'Vessel',
              items: vessels ?? [],
              currentValue: vesselSelected,
              onChange: (vessel) {
                appointment.vesselId.value = vessel.id;
                vesselSelected = vessel;
              },
              itemName: (vessel) {
                return vessel?.name;
              },
              placeholder: appointment?.vesselName?.value,
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            EnumInputWidget<Port>(
              title: 'Port',
              items: Port.values,
              currentValue: appointment?.port?.value,
              onChange: (port) => appointment.port.value = port,
              itemName: EnumUtil.appointmentPortToString,
              placeholder: EnumUtil.appointmentPortToString(appointment?.port?.value),
            ),
            SizedBox(width: 40.0),
            EnumInputWidget<OperationType>(
              title: 'Operation',
              items: OperationType.values,
              currentValue: appointment?.operationType?.value,
              onChange: (operationType) =>
                  appointment.operationType.value = operationType,
              itemName: EnumUtil.appointmentOperationTypeToString,
              placeholder: EnumUtil.appointmentOperationTypeToString(
                  appointment?.operationType?.value),
            ),
          ],
        ),
      ],
    );
  }
}
