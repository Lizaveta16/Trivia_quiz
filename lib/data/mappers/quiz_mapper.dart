import 'package:trivia_test_task/domain/domain.dart';

import '../entities/quiz_entity.dart';

class QuizMapper {
  static QuizModel toModel(QuizEntity entity) {
    return QuizModel(
      type: entity.type,
      difficulty: entity.difficulty,
      category: entity.category,
      question: entity.question,
      correctAnswer: entity.correctAnswer,
      incorrectAnswers: entity.incorrectAnswers,
    );
  }
}
