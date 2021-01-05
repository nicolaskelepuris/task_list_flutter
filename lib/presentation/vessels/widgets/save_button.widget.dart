import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveButtonWidget extends StatelessWidget {
  final void Function() onTap;
  const SaveButtonWidget({@required this.onTap});

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
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}