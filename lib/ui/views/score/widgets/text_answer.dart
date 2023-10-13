import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';

class TextAnswer extends StatelessWidget {
  final String answer;
  final TextStyle? textStyle;
  final bool isCorrect;

  const TextAnswer({
    super.key,
    this.answer = '',
    this.textStyle,
    this.isCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    final unescape = HtmlUnescape();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isCorrect
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.close, color: Colors.red),
        SizedBox(width: 8.w),
        Expanded(child: Text(unescape.convert(answer), style: textStyle)),
      ],
    );
  }
}
