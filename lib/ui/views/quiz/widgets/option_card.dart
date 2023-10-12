import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../app/theme/app_text_theme.dart';
import '../quiz_viewmodel.dart';

class OptionCard extends StackedHookView<QuizViewModel> {
  final String text;

  const OptionCard({
    super.key,
    required this.text,
  });

  @override
  Widget builder(BuildContext context, QuizViewModel model) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextTheme.getThemeText()
              .bodyLarge
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
