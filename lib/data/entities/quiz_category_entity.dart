import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'quiz_category_entity.freezed.dart';

part 'quiz_category_entity.g.dart';

@freezed
@HiveType(typeId: 1)
class QuizCategoryEntity with _$QuizCategoryEntity {
  const factory QuizCategoryEntity({
    @HiveField(1) @Default(0) int id,
    @HiveField(2) @Default('') String name,
  }) = _QuizCategoryEntity;

  factory QuizCategoryEntity.fromJson(Map<String, dynamic> json) => _$QuizCategoryEntityFromJson(json);
}
