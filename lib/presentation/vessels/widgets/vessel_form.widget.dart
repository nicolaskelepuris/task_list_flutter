import 'package:flutter/material.dart';
import 'package:task_list_app/domain/vessel/models/vessel.dart';
import 'package:task_list_app/helpers/input_validator.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextFieldWidget(
              label: 'Nome',
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
              label: 'Bandeira',
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
                vessel.deadweight = _validateNotRequiredDoubleInput(val) ? (double.tryParse(val) ?? 0) : null;
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
                vessel.lengthOverall = _validateNotRequiredDoubleInput(val) ? (double.tryParse(val) ?? 0) : null;
              },
              textInitialValue:
                  hasInitialValue ? vessel.lengthOverall.toString() : null,
            ),
            SizedBox(width: 40),
            TextFieldWidget(
              label: 'Beam',
              width: .2,
              onChanged: (val) {
                vessel.beam = _validateNotRequiredDoubleInput(val) ? (double.tryParse(val) ?? 0) : null;
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
                vessel.depth = _validateNotRequiredDoubleInput(val) ? (double.tryParse(val) ?? 0) : null;
              },
              textInitialValue: hasInitialValue ? vessel.depth.toString() : null,
            ),
          ],
        ),
      ],
    );
  }
}
