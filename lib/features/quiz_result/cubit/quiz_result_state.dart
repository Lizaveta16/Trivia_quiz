part of 'quiz_result_cubit.dart';

class QuizResultState extends Equatable {
  final QuizCategoryModel category;
  final int correctAnswersCount;
  final int wrongAnswersCount;

  const QuizResultState({
    required this.category,
    required this.correctAnswersCount,
    required this.wrongAnswersCount,
  });

  @override
  List<Object?> get props => [
        category,
        correctAnswersCount,
        wrongAnswersCount,
      ];
}
