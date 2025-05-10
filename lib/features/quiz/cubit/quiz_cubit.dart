import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/service/toast_service.dart';
import 'package:trivia_test_task/domain/domain.dart';
import 'package:trivia_test_task/navigation/app_router.dart';
import 'package:trivia_test_task/navigation/router_constants.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final AppRouter _appRouter;
  final GetQuizQuestionsUseCase _getQuizQuestionsUseCase;
  final ToastService _toastService;

  QuizCubit({
    required AppRouter appRouter,
    required GetQuizQuestionsUseCase getQuizQuestionsUseCase,
    required ToastService toastService,
    required QuizCategoryModel category,
  })  : _appRouter = appRouter,
        _getQuizQuestionsUseCase = getQuizQuestionsUseCase,
        _toastService = toastService,
        super(QuizState(category: category));

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<QuizModel> questions = await _getQuizQuestionsUseCase.execute(state.category);
      emit(
        state.copyWith(
          questions: questions,
          answers: List.generate(questions.length, (index) => ''),
          currentQuestionIndex: 0,
        ),
      );
    } catch (e) {
      _toastService.showToast(message: e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onAnswerSelected(String index) {
    final List<String> temp = [...state.answers];
    temp[state.currentQuestionIndex] = index;
    if (state.questions[state.currentQuestionIndex].isAnswerCorrect(index)) {
      emit(state.copyWith(
        answers: temp,
        correctAnswersCount: state.correctAnswersCount + 1,
      ));
    } else {
      emit(state.copyWith(
        answers: temp,
        wrongAnswersCount: state.wrongAnswersCount + 1,
      ));
    }
  }

  void nextQuestion() {
    if (state.currentQuestionIndex == state.questions.length - 1) {
      _appRouter.router.pushReplacement(
        RouterConstants.quizResult,
        extra: {
          'category': state.category,
          'correctAnswersCount': state.correctAnswersCount,
          'wrongAnswersCount': state.wrongAnswersCount,
        },
      );
      return;
    }
    emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1));
  }
}
