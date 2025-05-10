import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/core.dart';
import 'package:trivia_test_task/domain/domain.dart';
import 'package:trivia_test_task/navigation/app_router.dart';

import '../cubit/quiz_result_cubit.dart';
import 'quiz_result_form.dart';

class QuizResultScreen extends StatelessWidget {
  final QuizCategoryModel category;
  final int correctAnswersCount;
  final int wrongAnswersCount;

  const QuizResultScreen({
    super.key,
    required this.category,
    required this.correctAnswersCount,
    required this.wrongAnswersCount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizResultCubit(
        appRouter: appLocator<AppRouter>(),
        category: category,
        correctAnswersCount: correctAnswersCount,
        wrongAnswersCount: wrongAnswersCount,
      ),
      child: const QuizResultForm(),
    );
  }
}
