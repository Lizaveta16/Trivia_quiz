import 'package:flutter/material.dart';
import 'package:trivia_test_task/core_ui/theme/theme.dart';
import 'package:trivia_test_task/domain/domain.dart';

import 'answer_item.dart';

class QuizItem extends StatefulWidget {
  final QuizModel quiz;
  final void Function(String answer) onAnswerSelected;
  final String selectedAnswer;

  const QuizItem({
    super.key,
    required this.quiz,
    required this.onAnswerSelected,
    required this.selectedAnswer,
  });

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  late final List<String> _answers;

  @override
  void initState() {
    super.initState();
    _answers = [...widget.quiz.incorrectAnswers, widget.quiz.correctAnswer]..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final bool isAnswered = widget.selectedAnswer.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimens.padding40,
                horizontal: AppDimens.padding16,
              ),
              child: Text(
                widget.quiz.question,
                style: TextStyle(fontSize: AppDimens.padding24),
                textAlign: TextAlign.center,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: _answers.length,
              separatorBuilder: (context, index) => const SizedBox(height: AppDimens.padding8),
              itemBuilder: (context, index) {
                final String answer = _answers[index];
                final bool isSelected = widget.selectedAnswer == answer;

                return AnswerItem(
                  key: ValueKey(answer),
                  answer: answer,
                  onTap: isAnswered ? null : () => widget.onAnswerSelected(answer),
                  isCorrect: widget.quiz.isAnswerCorrect(answer),
                  isSelected: isSelected,
                  isAnswered: isAnswered,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
