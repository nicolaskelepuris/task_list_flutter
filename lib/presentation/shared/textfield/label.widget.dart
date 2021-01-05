import 'package:flutter/material.dart';
import 'package:task_list_app/infrastructure/theme/colors.theme.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  final bool requiredField;
  const LabelWidget({@required this.label, @required this.requiredField});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: ColorsTheme.primaryOpacity.withOpacity(.8),
          ),
        ),
        SizedBox(width: 5),
        Visibility(
          visible: requiredField,
          child: Text('*', style: TextStyle(color: Colors.red)),
        )
      ],
    );
  }
}
