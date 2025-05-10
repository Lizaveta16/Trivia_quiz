import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_test_task/core/core.dart';
import 'package:trivia_test_task/core_ui/theme/theme.dart';
import 'package:trivia_test_task/core_ui/widgets/app_button.dart';
import 'package:trivia_test_task/domain/models/quiz_model.dart';

import '../cubit/quiz_cubit.dart';
import '../widgets/quiz_item.dart';

class QuizForm extends StatefulWidget {
  const QuizForm({super.key});

  @override
  State<QuizForm> createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final QuizState state = context.watch<QuizCubit>().state;
    final QuizCubit cubit = context.read<QuizCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(state.category.name),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(AppDimens.padding16),
                child: BlocConsumer<QuizCubit, QuizState>(
                  listenWhen: (previous, current) => previous.currentQuestionIndex != current.currentQuestionIndex,
                  listener: (BuildContext context, QuizState state) {
                    _pageController.animateToPage(
                      state.currentQuestionIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  builder: (BuildContext context, QuizState state) {
                    final String currentQuestionAnswer = state.answers[state.currentQuestionIndex];

                    return Column(
                      spacing: AppDimens.size16,
                      children: <Widget>[
                        Text(
                          '${state.currentQuestionIndex + 1}/${state.questions.length}',
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.questions.length,
                            itemBuilder: (context, index) {
                              final QuizModel quiz = state.questions[index];

                              return QuizItem(
                                quiz: quiz,
                                onAnswerSelected: cubit.onAnswerSelected,
                                selectedAnswer: currentQuestionAnswer,
                              );
                            },
                          ),
                        ),
                        if (currentQuestionAnswer.isNotEmpty)
                          AppButton(
                            text: state.currentQuestionIndex == state.questions.length - 1
                                ? LocaleKeys.finish.tr()
                                : LocaleKeys.next.tr(),
                            onTap: cubit.nextQuestion,
                          ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
