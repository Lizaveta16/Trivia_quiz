import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz_entity.dart';

part 'quiz_questions_response_entity.freezed.dart';

part 'quiz_questions_response_entity.g.dart';

@freezed
class QuizQuestionsResponseEntity with _$QuizQuestionsResponseEntity {
  const factory QuizQuestionsResponseEntity({
    @Default(0) @JsonKey(name: 'response_code') int responseCode,
    @Default([]) @JsonKey(name: 'results') List<QuizEntity> questions,
  }) = _QuizQuestionsResponseEntity;

  factory QuizQuestionsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionsResponseEntityFromJson(json);
}
