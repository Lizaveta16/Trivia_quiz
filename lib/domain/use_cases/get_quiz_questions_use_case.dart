import 'package:trivia_test_task/domain/domain.dart';

import 'usecase.dart';

class GetQuizQuestionsUseCase implements FutureUseCase<QuizCategoryModel, List<QuizModel>> {
  final QuizRepository _quizRepository;

  GetQuizQuestionsUseCase({
    required QuizRepository quizRepository,
  }) : _quizRepository = quizRepository;

  @override
  Future<List<QuizModel>> execute(QuizCategoryModel input) {
    return _quizRepository.getQuizQuestions(categoryId: input.id);
  }
}
