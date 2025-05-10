import '../entities/responses/quiz_categories_response_entity.dart';
import '../entities/responses/quiz_questions_response_entity.dart';
import '../entities/responses/token_response_entity.dart';

abstract class QuizProvider {
  Future<TokenResponseEntity> getToken();

  Future<QuizCategoriesResponseEntity> getQuizCategories();

  Future<QuizQuestionsResponseEntity> getQuizQuestions({
    required int amount,
    required String token,
    required int categoryId,
  });
}
