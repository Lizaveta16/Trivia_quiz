import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trivia_test_task/core/di/app_di.dart';
import 'package:trivia_test_task/core/localization/app_localization.dart';
import 'package:trivia_test_task/features/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDI.init();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      path: AppLocalization.langFolderPath,
      startLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}
