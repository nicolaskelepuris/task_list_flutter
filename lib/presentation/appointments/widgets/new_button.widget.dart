import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String buttonText;
  const NewButtonWidget({@required this.onTap, this.buttonText = 'New'});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onTap,
      color: Get.theme.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        height: 35,
        width: 75,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
