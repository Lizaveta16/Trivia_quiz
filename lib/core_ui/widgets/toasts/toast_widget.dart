import 'package:flutter/material.dart';
import 'package:trivia_test_task/core_ui/theme/theme.dart';

class ToastWidget extends StatelessWidget {
  final String message;

  const ToastWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.mineShaft),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius10),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimens.size12),
        child: Text(
          message,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
