import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../app/theme/app_text_theme.dart';
import '../quiz_viewmodel.dart';

class QuestionCard extends StackedHookView<QuizViewModel> {
  final String text;

  const QuestionCard({super.key, required this.text});

  @override
  Widget builder(BuildContext context, QuizViewModel model) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 6.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: AppTextTheme.getThemeText()
            .bodyLarge
            ?.copyWith(color: Colors.black),
      ),
    );
  }
}
