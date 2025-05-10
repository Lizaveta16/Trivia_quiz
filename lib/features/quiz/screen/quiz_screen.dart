import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/di/app_di.dart';
import 'package:trivia_test_task/core/service/toast_service.dart';
import 'package:trivia_test_task/domain/domain.dart';
import 'package:trivia_test_task/navigation/app_router.dart';

import '../cubit/quiz_cubit.dart';
import 'quiz_form.dart';

class QuizScreen extends StatelessWidget {
  final QuizCategoryModel category;

  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(
        appRouter: appLocator<AppRouter>(),
        getQuizQuestionsUseCase: appLocator<GetQuizQuestionsUseCase>(),
        toastService: appLocator<ToastService>(),
        category: category,
      )..init(),
      child: const QuizForm(),
    );
  }
}
