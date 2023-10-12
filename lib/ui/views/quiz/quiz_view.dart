import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/ui/views/quiz/widgets/option_card.dart';
import 'package:quiz_app/ui/views/quiz/widgets/question_card.dart';
import 'package:stacked/stacked.dart';

import '../../../app/contants/custom_colors.dart';
import '../../../app/theme/app_text_theme.dart';
import 'quiz_viewmodel.dart';
import 'widgets/timer_indicator.dart';

class QuizView extends StackedView<QuizViewModel> {
  const QuizView({super.key});

  @override
  void onViewModelReady(QuizViewModel viewModel) {
    if (viewModel.ticker != viewModel.maxSecond) viewModel.startTimer();
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
              margin: EdgeInsets.symmetric(vertical: 36.h),
              height: double.maxFinite,
              width: double.maxFinite,
              child: Column(
                children: [
                  // Question
                  // TODO: Replace from DB (Firestore)
                  const QuestionCard(
                      text:
                          "Which is the fastest animal on the land?, Which is the fastest animal on the land?, Which is the fastest animal on the land?, Which is the fastest animal on the land?"),
                  SizedBox(height: 30.h),

                  // Options
                  // TODO: Replace from DB (Firestore)
                  for (int index = 0; index < 4; index++)
                    const OptionCard(text: "Lion"),
                ],
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
