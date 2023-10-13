import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';

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
    final unescape = HtmlUnescape();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
        ),
        child: Text(
          unescape.convert(text),
          textAlign: TextAlign.center,
          style: AppTextTheme.getThemeText()
              .bodyLarge
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
