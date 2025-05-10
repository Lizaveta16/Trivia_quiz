import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_model.freezed.dart';

@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    required String type,
    required String difficulty,
    required String category,
    required String question,
    required String correctAnswer,
    required List<String> incorrectAnswers,
  }) = _QuizModel;

  factory QuizModel.empty() => QuizModel(
        type: '',
        difficulty: '',
        category: '',
        question: '',
        correctAnswer: '',
        incorrectAnswers: [''],
      );
}
