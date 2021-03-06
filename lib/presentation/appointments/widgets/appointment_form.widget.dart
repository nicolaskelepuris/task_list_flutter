import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_app/domain/core/enums/appointment_type.dart';
import 'package:task_list_app/domain/vessel/models/appointment.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/helpers/input_validator.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/appointment/widgets/appointment_date_inputs.widget.dart';
import 'package:task_list_app/presentation/appointment/widgets/appointment_enum_inputs.widget.dart';
import 'package:task_list_app/presentation/appointments/widgets/task_list.widget.dart';
import 'package:task_list_app/presentation/shared/textfield/text_field.widget.dart';

import 'new_button.widget.dart';
import 'task_property.widget.dart';

class AppointmentFormWidget extends StatelessWidget {
  final bool hasInitialValue;
  final Appointment appointment;
  final List<Vessel> vessels;
  final Vessel vesselSelected;
  final Rx<AppointmentType> appointmentType;
  final Function onAddTaskPressed;
  AppointmentFormWidget({
    @required this.hasInitialValue,
    @required this.appointment,
    @required this.vessels,
    this.vesselSelected,
    this.appointmentType,
    this.onAddTaskPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppointmentEnumInputsWidget(
          appointment: appointment,
          vessels: vessels,
          vesselSelected: vesselSelected,
        ),
        SizedBox(height: 25),
        AppointmentDateInputsWidget(
          hasInitialValue: hasInitialValue,
          appointment: appointment,
        ),
        SizedBox(height: 5),
        Obx(
          () {
            return _getInputWidgets();
          },
        ),
        SizedBox(height: PlatformChecker.isMobile() ? 0 : 25),
        Divider(
          color: Colors.black,
        ),
        PlatformChecker.isMobile()
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TaskPropertyWidget(
                      property: 'Tasks',
                      bold: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                    padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.add,
                        size: 28,
                      ),
                      onPressed: onAddTaskPressed,
                    ),
                  )
                ],
              )
            : TaskPropertyWidget(
                property: 'Tasks',
                bold: true,
              ),
        Divider(
          color: Colors.black,
        ),
        Obx(
          () {
            return appointment.tasks.isNotEmpty
                ? TaskListWidget(
                    appointment: appointment,
                  )
                : TaskPropertyWidget(
                    property: 'No task found',
                  );
          },
        ),
      ],
    );
  }

  Widget _getInputWidgets() {
    switch (appointmentType?.value ?? AppointmentType.consigneeAgent) {
      case AppointmentType.consigneeAgent:
        return PlatformChecker.isMobile()
            ? _getMobileInputsForConsigneeAgent()
            : Column(
                children: [
                  Row(
                    children: [
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'DUV',
                            width: .2,
                            textInitialValue: hasInitialValue
                                ? appointment.duvNumber.value
                                : null,
                            onChanged: (val) =>
                                appointment.duvNumber.value = val,
                          );
                        },
                      ),
                      SizedBox(width: 40),
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'Schedule',
                            width: .2,
                            onChanged: (val) =>
                                appointment.scheduleNumber.value = val,
                            textInitialValue: hasInitialValue
                                ? appointment.scheduleNumber.value
                                : null,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'Voyage',
                            width: .2,
                            onChanged: (val) =>
                                appointment.voyageNumber.value = val,
                            textInitialValue: hasInitialValue
                                ? appointment.voyageNumber.value
                                : null,
                          );
                        },
                      ),
                      SizedBox(width: 40),
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'Cargo',
                            width: .2,
                            onChanged: (val) => appointment.cargo.value = val,
                            textInitialValue: hasInitialValue
                                ? appointment.cargo.value
                                : null,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Has crew change?'),
                      ),
                      SizedBox(width: 2),
                      Checkbox(
                        value: appointment.hasCrewChange.value,
                        onChanged: (value) {
                          appointment.hasCrewChange.value = value;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'On-signers',
                            width: .2,
                            onChanged: (val) => appointment.onSigners.value =
                                _validateNotRequiredIntegerInput(val)
                                    ? (int.tryParse(val) ?? 0)
                                    : null,
                            textInitialValue: hasInitialValue
                                ? appointment.onSigners.value.toString()
                                : null,
                            enabled: appointment.hasCrewChange.value,
                          );
                        },
                      ),
                      SizedBox(width: 40),
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'Off-signers',
                            width: .2,
                            onChanged: (val) => appointment.offSigners.value =
                                _validateNotRequiredIntegerInput(val)
                                    ? (int.tryParse(val) ?? 0)
                                    : null,
                            textInitialValue: hasInitialValue
                                ? appointment.offSigners.value.toString()
                                : null,
                            enabled: appointment.hasCrewChange.value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
      case AppointmentType.crewChange:
        return PlatformChecker.isMobile()
            ? _getMobileInputsForCrewChange()
            : Row(
                children: [
                  Builder(
                    builder: (_) {
                      return TextFieldWidget(
                        label: 'On-signers',
                        width: .2,
                        onChanged: (val) => appointment.onSigners.value =
                            _validateNotRequiredIntegerInput(val)
                                ? (int.tryParse(val) ?? 0)
                                : null,
                        textInitialValue: hasInitialValue
                            ? appointment.onSigners.value.toString()
                            : null,
                        enabled: appointment.hasCrewChange.value,
                      );
                    },
                  ),
                  SizedBox(width: 40),
                  Builder(
                    builder: (_) {
                      return TextFieldWidget(
                        label: 'Off-signers',
                        width: .2,
                        onChanged: (val) => appointment.offSigners.value =
                            _validateNotRequiredIntegerInput(val)
                                ? (int.tryParse(val) ?? 0)
                                : null,
                        textInitialValue: hasInitialValue
                            ? appointment.offSigners.value.toString()
                            : null,
                        enabled: appointment.hasCrewChange.value,
                      );
                    },
                  ),
                ],
              );

      case AppointmentType.ownersProtectingAgent:
      case AppointmentType.husbandryServices:
        return PlatformChecker.isMobile()
            ? _getMobileInputsForHusbandryServices()
            : Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Has crew change?'),
                      ),
                      SizedBox(width: 2),
                      Checkbox(
                        value: appointment.hasCrewChange.value,
                        onChanged: (value) {
                          appointment.hasCrewChange.value = value;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'On-signers',
                            width: .2,
                            onChanged: (val) => appointment.onSigners.value =
                                _validateNotRequiredIntegerInput(val)
                                    ? (int.tryParse(val) ?? 0)
                                    : null,
                            textInitialValue: hasInitialValue
                                ? appointment.onSigners.value.toString()
                                : null,
                            enabled: appointment.hasCrewChange.value,
                          );
                        },
                      ),
                      SizedBox(width: 40),
                      Builder(
                        builder: (_) {
                          return TextFieldWidget(
                            label: 'Off-signers',
                            width: .2,
                            onChanged: (val) => appointment.offSigners.value =
                                _validateNotRequiredIntegerInput(val)
                                    ? (int.tryParse(val) ?? 0)
                                    : null,
                            textInitialValue: hasInitialValue
                                ? appointment.offSigners.value.toString()
                                : null,
                            enabled: appointment.hasCrewChange.value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
      default:
        return SizedBox();
    }
  }

  bool _validateNotRequiredIntegerInput(String input) {
    return InputValidator.isNullOrEmpty(input) ||
        InputValidator.canConvertToInt(input);
  }

  Widget _getMobileInputsForHusbandryServices() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Has crew change?'),
            ),
            SizedBox(width: 2),
            Checkbox(
              value: appointment.hasCrewChange.value,
              onChanged: (value) {
                appointment.hasCrewChange.value = value;
              },
            ),
          ],
        ),
        Column(
          children: [
            Builder(
              builder: (_) {
                return TextFieldWidget(
                  label: 'On-signers',
                  width: .2,
                  onChanged: (val) => appointment.onSigners.value =
                      _validateNotRequiredIntegerInput(val)
                          ? (int.tryParse(val) ?? 0)
                          : null,
                  textInitialValue: hasInitialValue
                      ? appointment.onSigners.value.toString()
                      : null,
                  enabled: appointment.hasCrewChange.value,
                );
              },
            ),
            Builder(
              builder: (_) {
                return TextFieldWidget(
                  label: 'Off-signers',
                  width: .2,
                  onChanged: (val) => appointment.offSigners.value =
                      _validateNotRequiredIntegerInput(val)
                          ? (int.tryParse(val) ?? 0)
                          : null,
                  textInitialValue: hasInitialValue
                      ? appointment.offSigners.value.toString()
                      : null,
                  enabled: appointment.hasCrewChange.value,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _getMobileInputsForCrewChange() {
    return Column(
      children: [
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'On-signers',
              width: .2,
              onChanged: (val) => appointment.onSigners.value =
                  _validateNotRequiredIntegerInput(val)
                      ? (int.tryParse(val) ?? 0)
                      : null,
              textInitialValue: hasInitialValue
                  ? appointment.onSigners.value.toString()
                  : null,
              enabled: appointment.hasCrewChange.value,
            );
          },
        ),
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'Off-signers',
              width: .2,
              onChanged: (val) => appointment.offSigners.value =
                  _validateNotRequiredIntegerInput(val)
                      ? (int.tryParse(val) ?? 0)
                      : null,
              textInitialValue: hasInitialValue
                  ? appointment.offSigners.value.toString()
                  : null,
              enabled: appointment.hasCrewChange.value,
            );
          },
        ),
      ],
    );
  }

  Widget _getMobileInputsForConsigneeAgent() {
    return Column(
      children: [
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'DUV',
              width: .2,
              textInitialValue:
                  hasInitialValue ? appointment.duvNumber.value : null,
              onChanged: (val) => appointment.duvNumber.value = val,
            );
          },
        ),
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'Schedule',
              width: .2,
              onChanged: (val) => appointment.scheduleNumber.value = val,
              textInitialValue:
                  hasInitialValue ? appointment.scheduleNumber.value : null,
            );
          },
        ),
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'Voyage',
              width: .2,
              onChanged: (val) => appointment.voyageNumber.value = val,
              textInitialValue:
                  hasInitialValue ? appointment.voyageNumber.value : null,
            );
          },
        ),
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'Cargo',
              width: .2,
              onChanged: (val) => appointment.cargo.value = val,
              textInitialValue:
                  hasInitialValue ? appointment.cargo.value : null,
            );
          },
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Has crew change?'),
            ),
            SizedBox(width: 2),
            Checkbox(
              value: appointment.hasCrewChange.value,
              onChanged: (value) {
                appointment.hasCrewChange.value = value;
              },
            ),
          ],
        ),
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'On-signers',
              width: .2,
              onChanged: (val) => appointment.onSigners.value =
                  _validateNotRequiredIntegerInput(val)
                      ? (int.tryParse(val) ?? 0)
                      : null,
              textInitialValue: hasInitialValue
                  ? appointment.onSigners.value.toString()
                  : null,
              enabled: appointment.hasCrewChange.value,
            );
          },
        ),
        Builder(
          builder: (_) {
            return TextFieldWidget(
              label: 'Off-signers',
              width: .2,
              onChanged: (val) => appointment.offSigners.value =
                  _validateNotRequiredIntegerInput(val)
                      ? (int.tryParse(val) ?? 0)
                      : null,
              textInitialValue: hasInitialValue
                  ? appointment.offSigners.value.toString()
                  : null,
              enabled: appointment.hasCrewChange.value,
            );
          },
        ),
      ],
    );
  }
}
