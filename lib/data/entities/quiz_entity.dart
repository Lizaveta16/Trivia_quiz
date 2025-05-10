import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'quiz_entity.freezed.dart';

part 'quiz_entity.g.dart';

@freezed
@HiveType(typeId: 2)
class QuizEntity with _$QuizEntity {
  const factory QuizEntity({
    @HiveField(1) @Default('') String type,
    @HiveField(2) @Default('') String difficulty,
    @HiveField(3) @Default('') String category,
    @HiveField(4) @Default('') String question,
    @HiveField(5) @Default('') @JsonKey(name: 'correct_answer') String correctAnswer,
    @HiveField(6) @Default([]) @JsonKey(name: 'incorrect_answers') List<String> incorrectAnswers,
  }) = _QuizEntity;

  factory QuizEntity.fromJson(Map<String, dynamic> json) => _$QuizEntityFromJson(json);
}
