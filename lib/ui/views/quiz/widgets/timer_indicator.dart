import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../app/contants/custom_colors.dart';
import '../quiz_viewmodel.dart';

class TimerIndicator extends StackedHookView<QuizViewModel> {
  const TimerIndicator({super.key});

  @override
  Widget builder(BuildContext context, QuizViewModel model) {
    return SizedBox(
      width: double.maxFinite,
      height: 6.h,
      child: Stack(
        children: [
          Container(
            height: 6.h,
            width: MediaQuery.of(context).size.width,
            color: CustomColors.accentColor,
          ),
          Container(
            height: 6.h,
            width: model.ticker * 7.2.w,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
