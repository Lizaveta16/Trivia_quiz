import '../models/quiz_category_model.dart';
import '../models/quiz_model.dart';

abstract class QuizRepository {
  Future<List<QuizCategoryModel>> getQuizCategories();

  Future<List<QuizModel>> getQuizQuestions({required int categoryId});
}
