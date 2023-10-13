import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Quiz extends Equatable {
  String? category, correctAnswer, difficulty, question, type, answer;
  List<String>? incorrectAnswers;

  Quiz({
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
        incorrectAnswers: json['incorrect_answers'] == null
            ? []
            : List<String>.from(json['incorrect_answers'].map((e) => e)),
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
