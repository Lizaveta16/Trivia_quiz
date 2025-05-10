import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_test_task/data/entities/quiz_category_entity.dart';

part 'quiz_categories_response_entity.freezed.dart';

part 'quiz_categories_response_entity.g.dart';

@freezed
class QuizCategoriesResponseEntity with _$QuizCategoriesResponseEntity {
  const factory QuizCategoriesResponseEntity({
    @Default([]) @JsonKey(name: 'trivia_categories') List<QuizCategoryEntity> categories,
  }) = _QuizCategoriesResponseEntity;

  factory QuizCategoriesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$QuizCategoriesResponseEntityFromJson(json);
}
