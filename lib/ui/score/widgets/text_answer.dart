import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isCorrect
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.close, color: Colors.red),
        Text(answer, style: textStyle),
      ],
    );
  }
}
