import 'package:trivia_test_task/domain/domain.dart';

import '../entities/quiz_category_entity.dart';

class QuizCategoryMapper {
  static QuizCategoryModel toModel(QuizCategoryEntity entity) {
    return QuizCategoryModel(
      id: entity.id,
      name: entity.name,
    );
  }
}