import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtil {
  static void showAlertDialog(BuildContext context, String title, String message) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Get.back();
      },
    );

    AlertDialog dialog = AlertDialog(
      title: SelectableText(title),
      content: SelectableText(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
