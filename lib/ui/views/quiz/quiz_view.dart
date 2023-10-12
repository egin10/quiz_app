import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/contants/custom_colors.dart';
import '../../../app/theme/app_text_theme.dart';
import 'quiz_viewmodel.dart';

class QuizView extends StackedView<QuizViewModel> {
  const QuizView({super.key});

  @override
  Widget builder(BuildContext context, QuizViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz Page'),
        backgroundColor: CustomColors.primaryColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => viewModel.navigateExit(),
            child: Text(
              'Exit',
              style: AppTextTheme.getThemeText().bodySmall,
            ),
          )
        ],
      ),
    );
  }

  @override
  QuizViewModel viewModelBuilder(BuildContext context) => QuizViewModel();
}
