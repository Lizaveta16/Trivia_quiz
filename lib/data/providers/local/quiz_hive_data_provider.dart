import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:trivia_test_task/core/constants/db_constants.dart';
import 'package:trivia_test_task/data/entities/quiz_category_entity.dart';
import 'package:trivia_test_task/data/entities/quiz_entity.dart';

import '../quiz_local_data_provider.dart';

class QuizHiveProvider extends QuizLocalDataProvider {
  final Box<List> _quizBox;
  final Box<List> _quizCategoriesBox;

  QuizHiveProvider(
    this._quizBox,
    this._quizCategoriesBox,
  );

  @override
  Future<List<QuizCategoryEntity>?> getQuizCategories() async {
    try {
      final List? raw = _quizCategoriesBox.get(DbConstants.keyCategories);

      return (raw)?.cast<QuizCategoryEntity>();
    } catch (e) {
      debugPrint('❌ Failed to read categories from Hive');
      return null;
    }
  }

  @override
  Future<List<QuizEntity>?> getQuizQuestions({
    required int amount,
    required int categoryId,
  }) async {
    try {
      final List? raw = _quizBox.get(categoryId);

      if (raw == null) return null;

      final List<QuizEntity> storedQuestions = (raw).cast<QuizEntity>();

      if (storedQuestions.length >= amount) {
        return storedQuestions.take(amount).toList();
      }

      return storedQuestions;
    } catch (e) {
      debugPrint('❌ Failed to read questions from Hive');
      return null;
    }
  }

  @override
  Future<void> saveCategories(List<QuizCategoryEntity> categories) async {
    try {
      await _quizCategoriesBox.put(DbConstants.keyCategories, categories);
    } catch (e) {
      debugPrint('❌ Failed to save categories to Hive');
    }
  }

  @override
  Future<void> saveQuestions({
    required int categoryId,
    required List<QuizEntity> questions,
  }) async {
    try {
      await _quizBox.put(categoryId, questions);
    } catch (e) {
      debugPrint('❌ Failed to save questions to Hive');
    }
  }
}
