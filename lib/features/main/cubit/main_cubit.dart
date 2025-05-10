import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/service/toast_service.dart';
import 'package:trivia_test_task/domain/domain.dart';
import 'package:trivia_test_task/domain/use_cases/usecase.dart';
import 'package:trivia_test_task/navigation/app_router.dart';
import 'package:trivia_test_task/navigation/router_constants.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final AppRouter _appRouter;
  final GetQuizCategoriesUseCase _getQuizCategoriesUseCase;
  final ToastService _toastService;

  MainCubit({
    required AppRouter appRouter,
    required GetQuizCategoriesUseCase getQuizCategoriesUseCase,
    required ToastService toastService,
  })  : _appRouter = appRouter,
        _getQuizCategoriesUseCase = getQuizCategoriesUseCase,
        _toastService = toastService,
        super(const MainState());

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await _getQuizCategoriesUseCase.execute(NoParams());
      emit(state.copyWith(isLoading: false, categories: categories));
    } catch (e) {
      _toastService.showToast(message: e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onCategorySelected(QuizCategoryModel category) {
    _appRouter.router.push(
      RouterConstants.quiz,
      extra: {'category': category},
    );
  }
}
