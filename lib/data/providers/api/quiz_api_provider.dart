import 'package:trivia_test_task/core/core.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../entities/responses/quiz_categories_response_entity.dart';
import '../../entities/responses/quiz_questions_response_entity.dart';
import '../../entities/responses/token_response_entity.dart';
import '../quiz_provider.dart';

part 'quiz_api_provider.g.dart';

@RestApi()
abstract class QuizApiProvider extends QuizProvider {
  factory QuizApiProvider(Dio dio) = _QuizApiProvider;

  @GET(ApiConstants.token)
  @override
  Future<TokenResponseEntity> getToken();

  @GET(ApiConstants.quizCategories)
  @override
  Future<QuizCategoriesResponseEntity> getQuizCategories();

  @GET(ApiConstants.quizQuestions)
  @override
  Future<QuizQuestionsResponseEntity> getQuizQuestions({
    @Query('amount') required int amount,
    @Query('token') required String token,
    @Query('category') required int categoryId,
  });
}
