import 'package:flutter/material.dart';
class PageHeaderWidget extends StatelessWidget {
  final List<Widget> options;
  final Function onBackPressed;
  const PageHeaderWidget({@required this.options, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF2F4F4), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            onBackPressed != null ? BackButton(onPressed: onBackPressed,) : SizedBox(),
            SizedBox(height: 30, child: Row(children: options)),
          ],
        ),
      ),
    );
  }
}