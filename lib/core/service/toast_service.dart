import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_test_task/core/di/app_di.dart';
import 'package:trivia_test_task/core_ui/widgets/toasts/toast_widget.dart';
import 'package:trivia_test_task/navigation/app_router.dart';

class ToastService {
  final FToast _fToast = FToast();

  void init() {
    final BuildContext? context = appLocator<AppRouter>().navigatorKey.currentContext;
    if (context != null) {
      _fToast.init(context);
    }
  }

  void showToast({
    required String message,
  }) {
    _fToast.showToast(
      toastDuration: const Duration(seconds: 2),
      isDismissible: true,
      gravity: ToastGravity.BOTTOM,
      child: ToastWidget(
        message: message,
      ),
    );
  }
}
