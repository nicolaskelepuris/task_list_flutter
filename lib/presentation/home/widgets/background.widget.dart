import 'package:flutter/material.dart';
import 'package:task_list_app/infrastructure/theme/colors.theme.dart';

class BackgroundWidget extends StatelessWidget {
  final List<Widget> children;
  const BackgroundWidget({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsTheme.primary,
              ColorsTheme.primaryLight,
            ],
            stops: [.6, 1],
          ),
        ),
        child: Column(children: children),
      ),
    );
  }
}