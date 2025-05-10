import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/domain/domain.dart';
import 'package:trivia_test_task/navigation/app_router.dart';
import 'package:trivia_test_task/navigation/router_constants.dart';

part 'quiz_result_state.dart';

class QuizResultCubit extends Cubit<QuizResultState> {
  final AppRouter _appRouter;

  QuizResultCubit({
    required AppRouter appRouter,
    required QuizCategoryModel category,
    required int correctAnswersCount,
    required int wrongAnswersCount,
  })  : _appRouter = appRouter,
        super(QuizResultState(
          category: category,
          correctAnswersCount: correctAnswersCount,
          wrongAnswersCount: wrongAnswersCount,
        ));

  void retryQuiz() {
    _appRouter.router.pushReplacement(
      RouterConstants.quiz,
      extra: {'category': state.category},
    );
  }

  void changeQuizCategory() {
    _appRouter.router.pop();
  }
}
