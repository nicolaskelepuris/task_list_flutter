import 'package:flutter/material.dart';

class TaskPropertyWidget extends StatelessWidget {
  TaskPropertyWidget({@required this.property, this.bold = false});
  final String property;
  final bool bold;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.1,
          constraints: BoxConstraints(minWidth: 100),
          child: Text(
            property,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
