import 'package:trivia_test_task/core/di/app_di.dart';
import 'package:trivia_test_task/core/service/toast_service.dart';
import 'package:trivia_test_task/domain/error_handler/app_exception.dart';

Future<dynamic> safeRequest(Future<dynamic> Function() request) async {
  try {
    return await request();
  } on AppException catch (e) {
    appLocator<ToastService>().showToast(message: e.message);
  }
}
