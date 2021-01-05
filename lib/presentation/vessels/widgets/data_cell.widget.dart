import 'package:flutter/material.dart';
import 'package:task_list_app/infrastructure/theme/colors.theme.dart';

class DataCellWidget extends DataCell {
  final String text;
  final double width;
  final bool center;
  DataCellWidget(
      {@required this.text, this.width, this.center = false, Function onTap})
      : super(
          Container(
            width: width,
            child: Text(
              text ?? '',
              textAlign: center ? TextAlign.center : TextAlign.start,
              style: TextStyle(color: ColorsTheme.primary.withOpacity(.7)),
            ),
          ),
        );
}
