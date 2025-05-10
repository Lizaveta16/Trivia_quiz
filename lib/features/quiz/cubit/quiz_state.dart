part of 'quiz_cubit.dart';

class QuizState extends Equatable {
  final bool isLoading;
  final QuizCategoryModel category;
  final List<QuizModel> questions;
  final int currentQuestionIndex;
  final List<String> answers;
  final int correctAnswersCount;
  final int wrongAnswersCount;

  const QuizState({
    required this.category,
    this.isLoading = false,
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.answers = const [],
    this.correctAnswersCount = 0,
    this.wrongAnswersCount = 0,
  });

  QuizState copyWith({
    bool? isLoading,
    QuizCategoryModel? category,
    List<QuizModel>? questions,
    int? currentQuestionIndex,
    List<String>? answers,
    int? correctAnswersCount,
    int? wrongAnswersCount,
  }) {
    return QuizState(
      isLoading: isLoading ?? this.isLoading,
      category: category ?? this.category,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      answers: answers ?? this.answers,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
      wrongAnswersCount: wrongAnswersCount ?? this.wrongAnswersCount,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        category,
        questions,
        currentQuestionIndex,
        answers,
        correctAnswersCount,
        wrongAnswersCount,
      ];
}
