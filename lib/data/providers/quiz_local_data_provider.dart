import 'package:trivia_test_task/data/entities/quiz_category_entity.dart';
import 'package:trivia_test_task/data/entities/quiz_entity.dart';

abstract class QuizLocalDataProvider {
  Future<List<QuizCategoryEntity>?> getQuizCategories();

  Future<void> saveCategories(List<QuizCategoryEntity> categories);

  Future<List<QuizEntity>?> getQuizQuestions({
    required int amount,
    required int categoryId,
  });

  Future<void> saveQuestions({
    required int categoryId,
    required List<QuizEntity> questions,
  });
}
