import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../app/contants/custom_colors.dart';
import '../../../app/contants/icon_constants.dart';
import '../../../app/theme/app_text_theme.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
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
            SizedBox(height: 80.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80.w),
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryBtnColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () => viewModel.navigateToQuiz(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: const Text('PLAY'),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80.w),
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryColor,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: CustomColors.primaryBtnColor,
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () => viewModel.navigateToTopics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    'TOPICS',
                    style: AppTextTheme.getThemeText()
                        .bodyMedium
                        ?.copyWith(color: CustomColors.primaryBtnColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Share
                TextButton(
                  onPressed: () => viewModel.share(),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Share",
                        style: AppTextTheme.getThemeText().bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 40.w),
                // Rate Us
                TextButton(
                  onPressed: () => viewModel.rate(),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_outlined,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Rate Us",
                        style: AppTextTheme.getThemeText().bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
