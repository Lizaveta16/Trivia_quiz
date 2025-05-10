import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_category_model.freezed.dart';

@freezed
class QuizCategoryModel with _$QuizCategoryModel {
  const factory QuizCategoryModel({
    required int id,
    required String name,
  }) = _QuizCategoryModel;
}
