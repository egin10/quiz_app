import 'package:equatable/equatable.dart';

class Quiz extends Equatable {
  final String? category, correctAnswer, difficulty, question, type, answer;
  final List<String>? incorrectAnswers;

  const Quiz({
    this.category,
    this.correctAnswer,
    this.answer,
    this.difficulty,
    this.question,
    this.type,
    this.incorrectAnswers,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        category: json['category'],
        correctAnswer: json['correct_answer'],
        difficulty: json['difficulty'],
        question: json['question'],
        type: json['type'],
        incorrectAnswers: json['incorrect_answer'],
      );

  @override
  List<Object?> get props => [
        category,
        correctAnswer,
        answer,
        difficulty,
        question,
        type,
        incorrectAnswers,
      ];
}
