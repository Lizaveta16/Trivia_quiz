import '../models/quiz_model.dart';

extension QuizExtension on QuizModel {
  bool isAnswerCorrect(String answer) => correctAnswer == answer;
}
