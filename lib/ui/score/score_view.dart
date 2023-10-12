import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/contants/custom_colors.dart';
import 'score_viewmodel.dart';

class ScoreView extends StackedView<ScoreViewModel> {
  const ScoreView({super.key});

  @override
  Widget builder(
      BuildContext context, ScoreViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Score'),
        backgroundColor: CustomColors.primaryColor,
        elevation: 0,
      ),
      // TODO: Slicing UI
      body: const SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
      ),
    );
  }

  @override
  ScoreViewModel viewModelBuilder(BuildContext context) => ScoreViewModel();
}
