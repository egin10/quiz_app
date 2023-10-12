import 'package:flutter/material.dart';

import '../contants/custom_colors.dart';
import 'app_text_theme.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: CustomColors.primaryColor,
    textTheme: AppTextTheme.getThemeText(),
    primaryColor: Colors.white,
  );
}
