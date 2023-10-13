import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/app_text_theme.dart';

class OptionCard extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionCard({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextTheme.getThemeText()
              .bodyLarge
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
