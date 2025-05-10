import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.padding24,
          vertical: AppDimens.padding10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.borderRadius16)),
          border: Border.all(
            color: AppColors.boulder,
          ),
        ),
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }
}
