import 'dart:async';

import 'package:trivia_test_task/core/constants/app_constants.dart';
import 'package:trivia_test_task/data/entities/quiz_category_entity.dart';
import 'package:trivia_test_task/data/entities/responses/token_response_entity.dart';
import 'package:trivia_test_task/data/providers/quiz_local_data_provider.dart';
import 'package:trivia_test_task/domain/domain.dart';

import '../entities/responses/quiz_categories_response_entity.dart';
import '../entities/responses/quiz_questions_response_entity.dart';
import '../mappers/quiz_category_mapper.dart';
import '../mappers/quiz_mapper.dart';
import '../providers/quiz_provider.dart';
import '../providers/safe_request.dart';
import '../providers/shared_preferencies_provider.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizProvider _quizProvider;
  final QuizLocalDataProvider _quizLocalDataProvider;
  final SharedPreferencesProvider _sharedPreferencesProvider;

  QuizRepositoryImpl({
    required QuizProvider quizProvider,
    required QuizLocalDataProvider quizLocalDataProvider,
    required SharedPreferencesProvider sharedPreferencesProvider,
  })  : _sharedPreferencesProvider = sharedPreferencesProvider,
        _quizLocalDataProvider = quizLocalDataProvider,
        _quizProvider = quizProvider;

  @override
  Future<List<QuizCategoryModel>> getQuizCategories() async {
    List<QuizCategoryEntity>? cachedCategories = await _quizLocalDataProvider.getQuizCategories();
    if (cachedCategories == null || cachedCategories.isEmpty) {
      final QuizCategoriesResponseEntity result = await safeRequest(() => _quizProvider.getQuizCategories());
      cachedCategories = result.categories;
      unawaited(_quizLocalDataProvider.saveCategories(cachedCategories));
    }
    return cachedCategories.map(QuizCategoryMapper.toModel).toList();
  }

  @override
  Future<List<QuizModel>> getQuizQuestions({required int categoryId}) async {
    if (_sharedPreferencesProvider.useCache) {
      final cachedQuestions = await _quizLocalDataProvider.getQuizQuestions(
        amount: AppConstants.questionsAmount,
        categoryId: categoryId,
      );
      if (cachedQuestions != null && cachedQuestions.isNotEmpty) {
        return cachedQuestions.map(QuizMapper.toModel).toList();
      } else {
        return await _getRemoteQuizQuestions(categoryId: categoryId);
      }
    } else {
      return await _getRemoteQuizQuestions(categoryId: categoryId);
    }
  }

  Future<List<QuizModel>> _getRemoteQuizQuestions({required int categoryId}) async {
    final String token = await _token();

    final QuizQuestionsResponseEntity result = await safeRequest(
      () => _quizProvider.getQuizQuestions(
        amount: AppConstants.questionsAmount,
        token: token,
        categoryId: categoryId,
      ),
    );

    if (result.responseCode == 4) {
      _refreshToken();
      _sharedPreferencesProvider.saveUseCacheStatus(true);
    }

    unawaited(_quizLocalDataProvider.saveQuestions(
      categoryId: categoryId,
      questions: result.questions,
    ));

    return result.questions.map(QuizMapper.toModel).toList();
  }

  Future<String> _token() async {
    final String? token = _sharedPreferencesProvider.sessionToken;
    if (token != null) {
      return token;
    } else {
      final TokenResponseEntity result = await safeRequest(() => _quizProvider.getToken());
      return result.token;
    }
  }

  Future<void> _refreshToken() async {
    final TokenResponseEntity result = await safeRequest(() => _quizProvider.getToken());
    await _sharedPreferencesProvider.saveSessionToken(result.token);
  }
}
