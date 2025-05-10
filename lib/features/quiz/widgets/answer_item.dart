import 'package:flutter/material.dart';
import 'package:trivia_test_task/core_ui/theme/theme.dart';

class AnswerItem extends StatelessWidget {
  final String answer;
  final VoidCallback? onTap;
  final bool isCorrect;
  final bool isAnswered;
  final bool isSelected;

  const AnswerItem({
    super.key,
    required this.answer,
    required this.onTap,
    required this.isCorrect,
    required this.isAnswered,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.black;
    Color backgroundColor = Colors.white;

    if (isAnswered) {
      if (isSelected) {
        backgroundColor = isCorrect ? AppColors.malachite : AppColors.crimson;
        borderColor = backgroundColor;
      } else if (isCorrect) {
        backgroundColor = AppColors.malachite.withOpacity(0.1);
        borderColor = AppColors.malachite;
      }
    }

    return GestureDetector(
      onTap: isAnswered ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppDimens.padding8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppDimens.borderRadius16)),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          answer,
          style: TextStyle(fontSize: AppDimens.fontSize16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
