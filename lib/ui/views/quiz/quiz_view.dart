import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../app/contants/custom_colors.dart';
import '../../../app/theme/app_text_theme.dart';
import 'quiz_viewmodel.dart';
import 'widgets/option_card.dart';
import 'widgets/question_card.dart';
import 'widgets/timer_indicator.dart';

class QuizView extends StackedView<QuizViewModel> {
  final String? topicName;

  const QuizView({
    super.key,
    this.topicName,
  });

  @override
  void onViewModelReady(QuizViewModel viewModel) {
    viewModel.initialQuiz(topicName);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(BuildContext context, QuizViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quiz Page'),
        backgroundColor: CustomColors.primaryColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => viewModel.navigateExit(),
            child: Text(
              'Exit',
              style: AppTextTheme.getThemeText().bodyMedium,
            ),
          )
        ],
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 46.h),
              height: double.maxFinite,
              width: double.maxFinite,
              child: viewModel.listQuiz.isNotEmpty
                  ? ListView(
                      children: [
                        // Question
                        QuestionCard(
                          text: viewModel.listQuiz[viewModel.currentQuizIndex]
                                  .question ??
                              'Quiz not found!',
                        ),
                        SizedBox(height: 30.h),

                        // Options
                        for (int index = 0;
                            index <
                                viewModel.listQuiz[viewModel.currentQuizIndex]
                                    .incorrectAnswers!.length;
                            index++)
                          OptionCard(
                            text: viewModel.listQuiz[viewModel.currentQuizIndex]
                                .incorrectAnswers![index],
                            onPressed: () => viewModel.selectAnswer(
                              viewModel.listQuiz[viewModel.currentQuizIndex]
                                  .incorrectAnswers![index],
                            ),
                          ),
                      ],
                    )
                  : const Center(
                      child: Text("Please wait."),
                    ),
            ),

            Positioned(
              top: 16.h,
              right: 16.w,
              child: Text(
                "${viewModel.listQuiz.isEmpty ? 0 : viewModel.currentQuizIndex + 1}/${viewModel.listQuiz.length}",
              ),
            ),

            // Timer Indicator
            const TimerIndicator()
          ],
        ),
      ),
    );
  }

  @override
  QuizViewModel viewModelBuilder(BuildContext context) => QuizViewModel();
}
