import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_test_task/core/di/app_di.dart';
import 'package:trivia_test_task/core/service/toast_service.dart';
import 'package:trivia_test_task/navigation/app_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TransitionBuilder fToastBuilder = FToastBuilder();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[...context.localizationDelegates],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: <Widget>[
            fToastBuilder(context, child),
            Builder(
              builder: (BuildContext context) {
                appLocator<ToastService>().init();
                return const SizedBox.shrink();
              },
            ),
          ],
        );
      },
      routerConfig: appLocator<AppRouter>().router,
    );
  }
}
