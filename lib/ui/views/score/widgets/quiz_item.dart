import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/app_text_theme.dart';
import 'text_answer.dart';

class QuizItem extends StatelessWidget {
  final String quiz, correctAnswer, answer;

  const QuizItem({
    super.key,
    required this.quiz,
    required this.correctAnswer,
    this.answer = '',
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
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quiz
          Text(quiz, style: textStyle),
          SizedBox(height: 16.h),

          // Show incorrect Answer
          answer != correctAnswer
              ? Row(
                  children: [
                    Expanded(
                      child: TextAnswer(
                        answer: answer.isEmpty ? 'No chosen' : answer,
                        textStyle: textStyle,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TextAnswer(
                        answer: correctAnswer,
                        textStyle: textStyle,
                        isCorrect: true,
                      ),
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
