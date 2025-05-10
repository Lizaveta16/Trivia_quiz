import 'package:trivia_test_task/domain/domain.dart';

import 'usecase.dart';

class GetQuizCategoriesUseCase implements FutureUseCase<NoParams, List<QuizCategoryModel>> {
  final QuizRepository _quizRepository;

  GetQuizCategoriesUseCase({
    required QuizRepository quizRepository,
  }) : _quizRepository = quizRepository;

  @override
  Future<List<QuizCategoryModel>> execute(NoParams input) {
    return _quizRepository.getQuizCategories();
  }
}
