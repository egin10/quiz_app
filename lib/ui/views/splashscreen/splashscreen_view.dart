import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../app/contants/icon_constants.dart';
import '../../../app/theme/app_text_theme.dart';
import 'splashscreen_viewmodel.dart';

class SplashScreenView extends StackedView<SplashScreenViewModel> {
  const SplashScreenView({super.key});

  @override
  void onViewModelReady(SplashScreenViewModel viewModel) {
    if (viewModel.second != 0) viewModel.startTimer();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SplashScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              IconConstants.iconIdea,
              height: 80.h,
              width: 80.w,
            ),
            SizedBox(height: 26.h),
            Text("Flutter Quiz App",
                style: AppTextTheme.getThemeText().headlineSmall),
            SizedBox(height: 16.h),
            Text(
              "Learn • Take Quiz • Repeat",
              style: AppTextTheme.getThemeText()
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              "V.1.0.0",
              style: AppTextTheme.getThemeText()
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              "egin10 🚀",
              style: AppTextTheme.getThemeText()
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }

  @override
  SplashScreenViewModel viewModelBuilder(BuildContext context) =>
      SplashScreenViewModel();
}
