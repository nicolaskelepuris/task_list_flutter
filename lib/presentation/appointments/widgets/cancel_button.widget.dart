import 'package:flutter/material.dart';

class CancelButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String buttonText;
  final double width;
  const CancelButtonWidget({@required this.onTap, this.buttonText = 'Cancel', this.width = 75});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onTap,
      elevation: 0,
      color: Color(0xFFE4E6EF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        height: 35,
        width: width,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.red[700]),
          ),
        ),
      ),
    );
  }
}
