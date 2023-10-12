import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/theme/app_text_theme.dart';
import 'text_answer.dart';

class QuizItem extends StatelessWidget {
  final String quiz, correctAnswer, incorrectAnswer;

  const QuizItem({
    super.key,
    required this.quiz,
    required this.correctAnswer,
    this.incorrectAnswer = '',
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextTheme.getThemeText().bodyMedium?.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        );

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 26.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quiz
          Text(quiz, style: textStyle),
          // Show incorrect Answer
          incorrectAnswer.isNotEmpty
              ? Row(
                  children: [
                    TextAnswer(
                      answer: incorrectAnswer,
                      textStyle: textStyle,
                    ),
                    SizedBox(width: 16.w),
                    TextAnswer(
                      answer: correctAnswer,
                      textStyle: textStyle,
                      isCorrect: true,
                    )
                  ],
                )
              : TextAnswer(
                  answer: correctAnswer,
                  textStyle: textStyle,
                  isCorrect: true,
                ),
        ],
      ),
    );
  }
}
