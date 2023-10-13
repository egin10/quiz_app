import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/contants/custom_colors.dart';
import '../../../app/models/quiz.dart';
import '../../../app/theme/app_text_theme.dart';
import 'score_viewmodel.dart';
import 'widgets/doughnut_chart.dart';
import 'widgets/quiz_item.dart';

class ScoreView extends StackedView<ScoreViewModel> {
  final List<Quiz> quizList;

  const ScoreView({
    super.key,
    required this.quizList,
  });

  @override
  Widget builder(
      BuildContext context, ScoreViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => viewModel.navigateToHome(),
        ),
        centerTitle: true,
        title: const Text('Your Score'),
        backgroundColor: CustomColors.primaryColor,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            // Doughnut Chart
            DoughnutChart(
              correct: viewModel.countAnswer(quizList, isCorrect: true),
              incorrect: viewModel.countAnswer(quizList),
              total: quizList.length.toDouble(),
            ),

            // Button Share Score
            ElevatedButton(
              onPressed: () => viewModel.shareResult(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 16.w,
                ),
              ),
              child: Text(
                "Share your score",
                style: AppTextTheme.getThemeText().bodyLarge?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ),

            SizedBox(height: 16.h),
            Text(
              "Your Report",
              style: AppTextTheme.getThemeText().headlineMedium,
            ),

            SizedBox(height: 26.h),
            // List of Quiz
            Expanded(
              child: ListView(
                children: [
                  for (int index = 0; index < quizList.length; index++)
                    QuizItem(
                      quiz: quizList[index].question ?? 'No Question',
                      correctAnswer:
                          quizList[index].correctAnswer ?? 'Not found',
                      answer: quizList[index].answer ?? '',
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ScoreViewModel viewModelBuilder(BuildContext context) => ScoreViewModel();
}
