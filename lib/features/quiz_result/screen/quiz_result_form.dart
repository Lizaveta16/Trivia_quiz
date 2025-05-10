import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/core.dart';
import 'package:trivia_test_task/core_ui/theme/theme.dart';
import 'package:trivia_test_task/core_ui/widgets/app_button.dart';

import '../cubit/quiz_result_cubit.dart';

class QuizResultForm extends StatelessWidget {
  const QuizResultForm({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizResultCubit cubit = context.read<QuizResultCubit>();
    final QuizResultState state = context.watch<QuizResultCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.quizResult.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.padding16),
        child: Column(
          spacing: AppDimens.size16,
          children: <Widget>[
            const Spacer(),
            Text(
              state.category.name,
              style: TextStyle(fontSize: AppDimens.fontSize24),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        LocaleKeys.correct.tr(),
                      ),
                      Text(
                        state.correctAnswersCount.toString(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        LocaleKeys.incorrect.tr(),
                      ),
                      Text(
                        state.wrongAnswersCount.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              text: LocaleKeys.retry.tr(),
              onTap: cubit.retryQuiz,
            ),
            AppButton(
              text: LocaleKeys.changeCategory.tr(),
              onTap: cubit.changeQuizCategory,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
