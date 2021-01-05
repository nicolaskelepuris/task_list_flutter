import 'package:flutter/material.dart';

import 'app_bar.theme.dart';
import 'button.theme.dart';
import 'colors.theme.dart';
import 'text.theme.dart';

ThemeData themeData = ThemeData(
  primaryColor: ColorsTheme.primary,
  appBarTheme: appBarTheme,
  buttonTheme: buttonTheme,
  textTheme: textTheme,
  hoverColor: Colors.blue[100].withOpacity(0.6),
  buttonColor: Colors.blue,
);
