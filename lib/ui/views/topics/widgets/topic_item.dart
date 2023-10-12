import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../app/contants/custom_colors.dart';
import '../../../../app/theme/app_text_theme.dart';
import '../topics_viewmodel.dart';

class TopicItem extends StackedHookView<TopicsViewModel> {
  final String name;

  const TopicItem({
    super.key,
    required this.name,
  });

  @override
  Widget builder(BuildContext context, TopicsViewModel model) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: ElevatedButton(
        onPressed: () => model.navigateToQuiz(name),
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.accentColor,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextTheme.getThemeText().bodyLarge,
            ),
            Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 36.h,
            ),
          ],
        ),
      ),
    );
  }
}
