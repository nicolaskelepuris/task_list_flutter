import 'package:flutter/material.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/helpers/input_validator.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/shared/textfield/text_field.widget.dart';

class VesselFormWidget extends StatelessWidget {
  final bool hasInitialValue;
  final Vessel vessel;
  VesselFormWidget({@required this.hasInitialValue, @required this.vessel});

  bool _validateNotRequiredDoubleInput(String input) {
    return InputValidator.isNullOrEmpty(input) ||
        InputValidator.canConvertToDouble(input);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformChecker.isMobile() ? buildForMobile() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextFieldWidget(
              label: 'Name',
              textInitialValue: hasInitialValue ? vessel.name : null,
              onChanged: (val) => vessel.name = val,
              width: .2,
              requiredField: true,
            ),
            SizedBox(width: 40),
            TextFieldWidget(
              label: 'Imo',
              width: .2,
              onChanged: (val) => vessel.imo = val,
              textInitialValue: hasInitialValue ? vessel.imo : null,
              requiredField: true,
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            TextFieldWidget(
              label: 'Flag',
              width: .2,
              onChanged: (val) => vessel.flag = val,
              textInitialValue: hasInitialValue ? vessel.flag : null,
              requiredField: true,
            ),
            SizedBox(width: 40),
            TextFieldWidget(
              label: 'Deadweight',
              width: .2,
              onChanged: (val) {
                val = val.replaceAll(new RegExp(','), '.');
                vessel.deadweight = _validateNotRequiredDoubleInput(val)
                    ? (double.tryParse(val) ?? 0)
                    : null;
              },
              textInitialValue:
                  hasInitialValue ? vessel.deadweight.toString() : null,
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            TextFieldWidget(
              label: 'LOA',
              width: .2,
              onChanged: (val) {
                val = val.replaceAll(new RegExp(','), '.');
                vessel.lengthOverall = _validateNotRequiredDoubleInput(val)
                    ? (double.tryParse(val) ?? 0)
                    : null;
              },
              textInitialValue:
                  hasInitialValue ? vessel.lengthOverall.toString() : null,
            ),
            SizedBox(width: 40),
            TextFieldWidget(
              label: 'Beam',
              width: .2,
              onChanged: (val) {
                val = val.replaceAll(new RegExp(','), '.');
                vessel.beam = _validateNotRequiredDoubleInput(val)
                    ? (double.tryParse(val) ?? 0)
                    : null;
              },
              textInitialValue: hasInitialValue ? vessel.beam.toString() : null,
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            TextFieldWidget(
              label: 'Depth',
              width: .2,
              onChanged: (val) {
                val = val.replaceAll(new RegExp(','), '.');
                vessel.depth = _validateNotRequiredDoubleInput(val)
                    ? (double.tryParse(val) ?? 0)
                    : null;
              },
              textInitialValue:
                  hasInitialValue ? vessel.depth.toString() : null,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildForMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          label: 'Name',
          textInitialValue: hasInitialValue ? vessel.name : null,
          onChanged: (val) => vessel.name = val,
          width: .2,
          requiredField: true,
        ),
        TextFieldWidget(
          label: 'Imo',
          width: .2,
          onChanged: (val) => vessel.imo = val,
          textInitialValue: hasInitialValue ? vessel.imo : null,
          requiredField: true,
        ),
        TextFieldWidget(
          label: 'Flag',
          width: .2,
          onChanged: (val) => vessel.flag = val,
          textInitialValue: hasInitialValue ? vessel.flag : null,
          requiredField: true,
        ),
        TextFieldWidget(
          label: 'Deadweight',
          width: .2,
          onChanged: (val) {
            val = val.replaceAll(new RegExp(','), '.');
            vessel.deadweight = _validateNotRequiredDoubleInput(val)
                ? (double.tryParse(val) ?? 0)
                : null;
          },
          textInitialValue:
              hasInitialValue ? vessel.deadweight.toString() : null,
        ),
        TextFieldWidget(
          label: 'LOA',
          width: .2,
          onChanged: (val) {
            val = val.replaceAll(new RegExp(','), '.');
            vessel.lengthOverall = _validateNotRequiredDoubleInput(val)
                ? (double.tryParse(val) ?? 0)
                : null;
          },
          textInitialValue:
              hasInitialValue ? vessel.lengthOverall.toString() : null,
        ),
        TextFieldWidget(
          label: 'Beam',
          width: .2,
          onChanged: (val) {
            val = val.replaceAll(new RegExp(','), '.');
            vessel.beam = _validateNotRequiredDoubleInput(val)
                ? (double.tryParse(val) ?? 0)
                : null;
          },
          textInitialValue: hasInitialValue ? vessel.beam.toString() : null,
        ),
        TextFieldWidget(
          label: 'Depth',
          width: .2,
          onChanged: (val) {
            val = val.replaceAll(new RegExp(','), '.');
            vessel.depth = _validateNotRequiredDoubleInput(val)
                ? (double.tryParse(val) ?? 0)
                : null;
          },
          textInitialValue: hasInitialValue ? vessel.depth.toString() : null,
        ),
      ],
    );
  }
}
